package controller

import (
	"auth-service/database"
	"auth-service/model"
	"net/http"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
)

// Register handles user registration
func Register(c *gin.Context) {
	var input model.User

	// Validasi input dari JSON
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Input tidak valid"})
		return
	}

	// Cek apakah email sudah terdaftar
	var existingEmail model.User
	if err := database.DB.Where("email = ?", input.Email).First(&existingEmail).Error; err == nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Email sudah terdaftar"})
		return
	}

	// Cek apakah nama pengguna sudah digunakan
	var existingNama model.User
	if err := database.DB.Where("nama = ?", input.Nama).First(&existingNama).Error; err == nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Nama pengguna sudah digunakan"})
		return
	}

	// Hash password
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(input.Password), bcrypt.DefaultCost)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Gagal mengenkripsi password"})
		return
	}
	input.Password = string(hashedPassword)

	// Set default role user (1 = Pasien)
	input.Role = 1

	// Simpan ke database
	if err := database.DB.Create(&input).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Gagal menyimpan user"})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"message": "Registrasi berhasil"})
}

// Login handles user login
func Login(c *gin.Context) {
	var input model.LoginInput

	// Validasi input login
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Input tidak valid"})
		return
	}

	// Cari user berdasarkan nama
	var user model.User
	if err := database.DB.Where("nama = ?", input.Nama).First(&user).Error; err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "User tidak ditemukan"})
		return
	}

	// Cocokkan password
	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(input.Password)); err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Password salah"})
		return
	}

	// Kirim respons berhasil login
	c.JSON(http.StatusOK, gin.H{
		"message": "Login berhasil",
		"user": gin.H{
			"id_user":   user.IDUser,
			"nama":      user.Nama,
			"email":     user.Email,
			"alamat":    user.Alamat,
			"tgl_lahir": user.TglLahir,
			"role":      user.Role,
		},
	})
}

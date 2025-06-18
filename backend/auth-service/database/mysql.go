package database

import (
	"auth-service/model"
	"fmt"
	"log"
	"os"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB

func InitDB() {
	// Ambil variabel dari environment (bisa juga langsung ditulis untuk sementara)
	dbUser := os.Getenv("DB_USER")
	dbPass := os.Getenv("DB_PASSWORD")
	dbHost := os.Getenv("DB_HOST")
	dbPort := os.Getenv("DB_PORT")
	dbName := os.Getenv("DB_NAME")

	// Format koneksi MySQL
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?parseTime=true",
		dbUser, dbPass, dbHost, dbPort, dbName,
	)

	// Koneksi
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatal("Gagal koneksi database:", err)
	}

	// Simpan ke variabel global DB
	DB = db

	// Auto migrate table dari model
	err = DB.AutoMigrate(&model.User{})
	if err != nil {
		log.Fatal("Gagal migrate tabel:", err)
	}

	fmt.Println("✅ Koneksi ke database berhasil!")
}

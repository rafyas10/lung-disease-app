package main

import (
	"auth-service/database"
	"auth-service/routes"
	"log"
	"os"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func main() {
	// Load .env file
	err := godotenv.Load()
	if err != nil {
		log.Fatal("❌ Gagal memuat file .env")
	}

	// Koneksi ke database
	database.InitDB()

	// Buat router Gin
	router := gin.Default()

	// Aktifkan CORS agar frontend bisa akses API dari domain berbeda (localhost ke 8080)
	router.Use(cors.Default())

	// Daftarkan semua route
	routes.RegisterAuthRoutes(router)

	// Jalankan server
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080" // fallback default
	}
	router.Run(":" + port)

	//testing
}

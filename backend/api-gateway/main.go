package main

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http/httputil"
	"net/url"
	"os"
)

func main() {
	r := gin.Default()

	authServiceEnv := os.Getenv("AUTH_SERVICE_URL")
	if authServiceEnv == "" {
		log.Fatal("AUTH_SERVICE_URL tidak ditemukan di environment")
	}

	authServiceURL, err := url.Parse(authServiceEnv)
	if err != nil {
		log.Fatalf("Gagal parsing AUTH_SERVICE_URL: %v", err)
	}

	authProxy := httputil.NewSingleHostReverseProxy(authServiceURL)

	r.Any("/api/*path", func(c *gin.Context) {
		c.Request.URL.Path = c.Param("path")
		authProxy.ServeHTTP(c.Writer, c.Request)
	})

	port := os.Getenv("GATEWAY_PORT")
	if port == "" {
		port = "8081"
	}
	log.Println("API Gateway berjalan di port", port)
	r.Run(":" + port)
}

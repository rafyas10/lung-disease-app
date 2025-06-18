package routes

import (
	"auth-service/controller"
	"github.com/gin-gonic/gin"
)

func RegisterAuthRoutes(router *gin.Engine) {
	// Group semua route dalam "/api"
	api := router.Group("/api") // <-- Gunakan prefix agar rapi

	api.POST("/register", controller.Register)
	api.POST("/login", controller.Login)
	api.POST("/diagnosa", controller.Diagnosa)
}

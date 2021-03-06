package main

import (
	"CRUD_APP/controller"
	"CRUD_APP/util"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {
	server := controller.Server{
		DB: util.InitDB(),
	}
	router := gin.Default()
	config := cors.DefaultConfig()
	config.AllowOrigins = []string{"http://localhost:3000"}
	router.Use(cors.New(config))

	router.GET("/:shopid/:menuid/menu", server.GetMenuHandler)

	router.POST("/:shopid/:menuid/menu/new", server.NewFoodHandler)

	router.Run(":8080")
}

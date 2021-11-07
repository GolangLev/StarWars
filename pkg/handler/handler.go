package handler

import (
	"github.com/GolangLev/Goland/StarWars/pkg/service"
	"github.com/gin-gonic/gin"
)

type Handler struct {
	service *service.Service
}

func NewHandler(service *service.Service) *Handler {
	return &Handler{service: service}
}

func (h *Handler) InitRoutes() *gin.Engine {

	router := gin.New()
	//router.LoadHTMLGlob("web/html/*.html")
	//router.Static("/assets/", "web/")

	main := router.Group("/")
	{
		main.GET("/", h.GetAllNews)
		main.GET("/news/:id", h.GetNewsById)

		api := main.Group("/api")
		{
			api.POST("/CreateNews", h.CreateNews)
			api.PUT("/UpdateNews/:id", h.UpdateNews)
			api.DELETE("/DeleteNews/:id", h.DeleteNews)
		}
	}

	return router
}

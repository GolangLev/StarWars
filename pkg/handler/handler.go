package handler

import (
	"github.com/GolangLev/Goland/StarWars/pkg/service"
	_ "github.com/GolangLev/Goland/StarWars/swagger"
	"github.com/gin-gonic/gin"
	"github.com/swaggo/files"
	"github.com/swaggo/gin-swagger"
	"net/http"
)

type Handler struct {
	service *service.Service
}

func NewHandler(service *service.Service) *Handler {
	return &Handler{service: service}
}

func (h *Handler) InitRoutes() *gin.Engine {

	router := gin.New()

	router.Use(CORSMiddleware())

	router.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))

	auth := router.Group("/auth")
	{
		auth.POST("/sign-up", h.SignUp)
		auth.POST("/sign-in", h.SignIn)
	}

	main := router.Group("/")
	{
		main.GET("/news", h.GetAllNews)
		main.GET("/news/:id", h.GetNewsById)

		api := main.Group("/api")
		{
			api.POST("/CreateNews", h.CreateNews)
			api.PUT("/UpdateNews/:id", h.UpdateNews)
			api.DELETE("/DeleteNews/:id", h.DeleteNews)
		}

		game := main.Group("/game")
		{
			game.GET("/", h.GetAllGames)
			game.GET("/:id", h.GetGameById)

			api := game.Group("/api")
			{
				api.POST("/CreateGame", h.CreateGame)
				api.PUT("/UpdateGame/:id", h.UpdateGame)
				api.DELETE("/DeleteGame/:id", h.DeleteGame)
			}
		}

		hero := main.Group("/hero")
		{
			hero.GET("/", h.GetAllHeroes)
			hero.GET("/:id", h.GetHeroById)

			api := hero.Group("/api")
			{
				api.POST("/CreateHero", h.CreateHero)
				api.PUT("/UpdateHero/:id", h.UpdateHero)
				api.DELETE("/DeleteHero/:id", h.DeleteHero)
			}
		}

		film := main.Group("/film")
		{
			film.GET("/", h.GetAllFilms)
			film.GET("/:id", h.GetFilmById)

			api := film.Group("/api")
			{
				api.POST("/CreateFilm", h.CreateFilm)
				api.PUT("/UpdateFilm/:id", h.UpdateFilm)
				api.DELETE("/DeleteFilm/:id", h.DeleteFilm)
			}
		}

		fraction := main.Group("/fraction")
		{
			fraction.GET("/", h.GetAllFraction)
			fraction.GET("/:id", h.GetFractionById)

			api := fraction.Group("/api")
			{
				api.POST("/CreateFraction", h.CreateFraction)
				api.PUT("/UpdateFraction/:id", h.UpdateFraction)
				api.DELETE("/DeleteFraction/:id", h.DeleteFraction)
			}
		}

		profile := main.Group("/auth-user", h.UserIdentity)
		{
			profile.GET("/user", h.GetUserById)
			profile.GET("/user/:id", h.GetUserProfile)
			profile.POST("/CreateComment", h.CreateComment)
			profile.PUT("/UpdateProfile/:id", h.UpdateProfile)
		}
	}

	return router
}

func CORSMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {

		c.Header("Access-Control-Allow-Origin", "*")
		c.Header("Access-Control-Allow-Credentials", "true")
		c.Header("Access-Control-Allow-Headers", "Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-With")
		c.Header("Access-Control-Allow-Methods", "POST,HEAD,PATCH, OPTIONS, GET, PUT")

		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(http.StatusNoContent)
			return
		}

		c.Next()
	}
}

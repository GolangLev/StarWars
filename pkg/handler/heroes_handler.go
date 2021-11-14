package handler

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/internal/server"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

// @Summary GetAllHeroes
// @Tags Hero
// @Description all info heroes
// @Accept json
// @Produce json
// @Param input body entities.HeroJoin true "HeroJoin"
// @Router /hero/ [get]

func (h *Handler) GetAllHeroes(c *gin.Context) {
	hero, err := h.service.Heroes.GetAllHeroes()
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Hero": hero,
	})
}

// @Summary GetHeroById
// @Tags Hero
// @Description all info by id
// @Accept json
// @Produce json
// @Param input body entities.HeroJoin true "HeroJoin"
// @Router /hero/:id [get]

func (h *Handler) GetHeroById(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	hero, err := h.service.Heroes.GetHeroById(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Hero": hero,
	})
}

// @Summary CreateHero
// @Tags Hero
// @Description add new hero
// @Accept json
// @Produce json
// @Param input body entities.Hero true "Hero"
// @Router /hero/api/CreateHero [post]

func (h *Handler) CreateHero(c *gin.Context) {
	var hero entities.Hero

	if err := c.BindJSON(&hero); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	id, err := h.service.Heroes.CreateHero(hero)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"id": id,
	})
}

// @Summary UpdateHero
// @Tags Hero
// @Description update info hero
// @Accept json
// @Produce json
// @Param input body entities.UpdateHero true "UpdateHero"
// @Router /hero/api/UpdateHero/:id [put]

func (h *Handler) UpdateHero(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	var hero entities.UpdateHero
	if err := c.BindJSON(&hero); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	if err := h.service.Heroes.UpdateHero(id, hero); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Hero": "Record Update",
	})
}

// @Summary DeleteHeroDeleteHero
// @Tags Hero
// @Description delete hero
// @Accept json
// @Produce json
// @Param input body entities.Hero true "Hero"
// @Router /hero/api/DeleteHero/:id [delete]

func (h *Handler) DeleteHero(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	err = h.service.Heroes.DeleteHero(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Hero": "Delete",
	})
}

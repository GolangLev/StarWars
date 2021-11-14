package handler

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/internal/server"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

func (h *Handler) GetAllFilms(c *gin.Context) {
	film, err := h.service.Films.GetAllFilms()
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Film": film,
	})
}

func (h *Handler) GetFilmById(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	film, err := h.service.Films.GetFilmById(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Film": film,
	})
}

func (h *Handler) CreateFilm(c *gin.Context) {
	var film entities.Film

	if err := c.BindJSON(&film); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	id, err := h.service.Films.CreateFilm(film)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"id": id,
	})
}

func (h *Handler) UpdateFilm(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	var film entities.UpdateFilm
	if err := c.BindJSON(&film); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	if err := h.service.Films.UpdateFilm(id, film); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Film": "Record Update",
	})
}

func (h *Handler) DeleteFilm(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	err = h.service.Films.DeleteFilm(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Film": "Delete",
	})
}

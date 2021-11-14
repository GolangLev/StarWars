package handler

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/internal/server"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

func (h *Handler) GetAllFraction(c *gin.Context) {
	fraction, err := h.service.Fractions.GetAllFraction()
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Fraction": fraction,
	})
}

func (h *Handler) GetFractionById(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	fraction, err := h.service.Fractions.GetFractionById(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Fraction": fraction,
	})
}

func (h *Handler) CreateFraction(c *gin.Context) {
	var fraction entities.Fraction

	if err := c.BindJSON(&fraction); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	id, err := h.service.Fractions.CreateFraction(fraction)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"id": id,
	})
}

func (h *Handler) UpdateFraction(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	var fraction entities.UpdateFraction
	if err := c.BindJSON(&fraction); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	if err := h.service.Fractions.UpdateFraction(id, fraction); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Fraction": "Record Update",
	})
}

func (h *Handler) DeleteFraction(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	err = h.service.Fractions.DeleteFraction(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"fraction": "Delete",
	})
}

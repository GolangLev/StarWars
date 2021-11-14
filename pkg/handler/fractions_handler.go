package handler

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/internal/server"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

// @Summary GetAllFraction
// @Tags Fraction
// @Description all info fraction
// @Accept json
// @Produce json
// @Param input body entities.Fraction true "Fraction"
// @Router /fraction/ [get]

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

// @Summary GetFractionById
// @Tags Fraction
// @Description all info fraction by id
// @Accept json
// @Produce json
// @Param input body entities.Fraction true "Fraction"
// @Router /fraction/:id [get]

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

// @Summary CreateFraction
// @Tags Fraction
// @Description add new fraction
// @Accept json
// @Produce json
// @Param input body entities.Fraction true "Fraction"
// @Router /fraction/api/CreateFraction [post]

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

// @Summary UpdateFraction
// @Tags Fraction
// @Description update fraction
// @Accept json
// @Produce json
// @Param input body entities.UpdateFraction true "UpdateFraction"
// @Router /fraction/api/UpdateFraction/:id [put]

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

// @Summary DeleteFraction
// @Tags Fraction
// @Description delete fraction
// @Accept json
// @Produce json
// @Param input body entities.Fraction true "Fraction"
// @Router /fraction/api/DeleteFraction/:id [delete]

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
		"Fraction": "Delete",
	})
}

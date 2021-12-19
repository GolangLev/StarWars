package handler

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/internal/server"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

func (h *Handler) GetUserById(c *gin.Context) {
	id, err := GetUserId(c)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	user, err := h.service.Profile.GetUserById(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"User": user,
	})
}

func (h *Handler) GetUserProfile(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	user, err := h.service.Profile.GetUserById(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"User": user,
	})
}

func (h *Handler) UpdateProfile(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	var updateUser entities.UpdateProfile
	if err := c.BindJSON(&updateUser); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	if err := h.service.Profile.UpdateProfile(id, updateUser); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Record": "Record update",
	})
}

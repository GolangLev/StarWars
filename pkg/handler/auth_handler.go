package handler

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/internal/server"
	"github.com/gin-gonic/gin"
	"net/http"
)

func (h *Handler) SignUp(c *gin.Context) {
	var user entities.Users

	if err := c.BindJSON(&user); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	id, err := h.service.Authorization.CreateUser(user)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusBadRequest, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Id": id,
	})
}

func (h *Handler) SignIn(c *gin.Context) {
	var input entities.SignInInput

	if err := c.BindJSON(&input); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	token, err := h.service.Authorization.SignInUser(input.Login, input.Password)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusBadRequest, err.Error())
		return
	}

	id, err := h.service.Authorization.GetUserByLoginAndPassword(input.Login, input.Password)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusBadRequest, err.Error())
		return
	}

	c.JSON(http.StatusOK, entities.ResponseAuthUser{
		Id:    id,
		Token: token,
	})
}

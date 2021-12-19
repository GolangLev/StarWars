package handler

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/internal/server"
	"github.com/gin-gonic/gin"
	"net/http"
)

func (h *Handler) CreateComment(c *gin.Context) {
	userId, err := GetUserId(c)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	var comment entities.Comments
	comment.UserId = userId

	if err := c.BindJSON(&comment); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	commentId, err := h.service.Comments.CreateComment(comment)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Id": commentId,
	})
}

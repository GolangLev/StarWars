package handler

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/internal/server"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

// @Summary GetAllNews
// @Tags News
// @Description all info
// @Accept json
// @Produce json
// @Param input body entities.News true "News"
// @Router / [get]

func (h *Handler) GetAllNews(c *gin.Context) {
	news, err := h.service.News.GetAllNews()
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Data": news,
	})
}

// @Summary GetNewsById
// @Tags News
// @Description all info by id
// @Accept json
// @Produce json
// @Param input body entities.News true "News"
// @Router /news/:id [get]

func (h *Handler) GetNewsById(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	news, err := h.service.News.GetNewsById(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Data": news,
	})
}

// @Summary CreateNews
// @Tags News
// @Description all info by id
// @Accept json
// @Produce json
// @Param input body entities.News true "News"
// @Router /api/CreateNews  [post]

func (h *Handler) CreateNews(c *gin.Context) {
	var news entities.News

	if err := c.BindJSON(&news); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	id, err := h.service.News.CreateNews(news)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"id": id,
	})
}

// @Summary UpdateNews
// @Tags News
// @Description update news
// @Accept json
// @Produce json
// @Param input body entities.News true "News"
// @Router /UpdateNews/:id [put]

func (h *Handler) UpdateNews(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	var news entities.UpdateNews
	if err := c.BindJSON(&news); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	if err := h.service.News.UpdateNews(id, news); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Data": "Record Update",
	})
}

// @Summary DeleteNews
// @Tags News
// @Description delete news
// @Accept json
// @Produce json
// @Param input body entities.UpdateNews true "UpdateNews"
// @Router /DeleteNews/:id [delete]

func (h *Handler) DeleteNews(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	err = h.service.News.DeleteNews(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Data": "Delete",
	})
}

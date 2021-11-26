package handler

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/internal/server"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

// @Summary GetAllGames
// @Tags Game
// @Description all info game
// @Accept json
// @Produce json
// @Param input body entities.Game true "Game"
// @Router /game/  [get]

func (h *Handler) GetAllGames(c *gin.Context) {
	game, err := h.service.Games.GetAllGames()
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Game": game,
	})
}

// @Summary GetGameById
// @Tags Game
// @Description all info by id
// @Accept json
// @Produce json
// @Param input body entities.Game true "Game"
// @Router /game/:id [get]

func (h *Handler) GetGameById(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	game, err := h.service.Games.GetGamesById(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Game": game,
	})
}

// @Summary CreateGame
// @Tags Game
// @Description add new game
// @Accept json
// @Produce json
// @Param input body entities.Game true "Game"
// @Router /game/api/CreateGame  [post]

func (h *Handler) CreateGame(c *gin.Context) {
	var game entities.Game

	if err := c.BindJSON(&game); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	id, err := h.service.Games.CreateGames(game)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"id": id,
	})
}

// @Summary UpdateGame
// @Tags Game
// @Description update game
// @Accept json
// @Produce json
// @Param input body entities.UpdateGames true "UpdateGames"
// @Router /game/api/UpdateGame/:id  [put]

func (h *Handler) UpdateGame(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	var game entities.UpdateGames
	if err := c.BindJSON(&game); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	if err := h.service.Games.UpdateGames(id, game); err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Game": "Record Update",
	})
}

// @Summary DeleteGame
// @Tags Game
// @Description delete game
// @Accept json
// @Produce json
// @Param input body entities.Game true "Game"
// @Router /game/api/DeleteGame/:id  [delete]

func (h *Handler) DeleteGame(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	err = h.service.Games.DeleteGames(id)
	if err != nil {
		server.NewMessageErrorResponse(c, http.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"Game": "Delete",
	})
}

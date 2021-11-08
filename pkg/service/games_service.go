package service

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/pkg/repository"
)

type GameService struct {
	repo repository.Games
}

func NewGameService(repo repository.Games) *GameService {
	return &GameService{repo: repo}
}

func (g *GameService) CreateGames(games entities.Game) (int, error) {
	return g.repo.CreateGames(games)
}

func (g *GameService) GetAllGames() ([]entities.Game, error) {
	return g.repo.GetAllGames()
}

func (g *GameService) GetGamesById(gameId int) (entities.Game, error) {
	return g.repo.GetGamesById(gameId)
}

func (g *GameService) DeleteGames(gameId int) error {
	return g.repo.DeleteGames(gameId)
}

func (g *GameService) UpdateGames(gameId int, game entities.UpdateGames) error {
	return g.repo.UpdateGames(gameId, game)
}

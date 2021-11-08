package repository

import (
	"fmt"
	"github.com/GolangLev/Goland/StarWars/internal/database"
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/jmoiron/sqlx"
)

type GameRepository struct {
	db *sqlx.DB
}

func NewGameRepository(db *sqlx.DB) *GameRepository {
	return &GameRepository{db: db}
}

func (g *GameRepository) CreateGames(games entities.Game) (int, error) {
	var id int

	query := fmt.Sprintf("INSERT INTO %s (title, subtitle, description) VALUES ($1, $2, $3) RETURNING id", database.TableGames)
	row := g.db.QueryRow(query, games.Title, games.SubTitle, games.Description)
	if err := row.Scan(&id); err != nil {
		return 0, err
	}

	return id, nil
}

func (g *GameRepository) GetAllGames() ([]entities.Game, error) {
	var game []entities.Game

	query := fmt.Sprintf("SELECT * FROM %s", database.TableGames)
	err := g.db.Select(&game, query)

	return game, err
}

func (g *GameRepository) GetGamesById(gameId int) (entities.Game, error) {
	var game entities.Game

	query := fmt.Sprintf("SELECT * FROM %s WHERE id = $1", database.TableGames)
	err := g.db.Get(&game, query, gameId)

	return game, err
}

func (g *GameRepository) DeleteGames(gameId int) error {
	query := fmt.Sprintf("DELETE FROM %s WHERE id = $1", database.TableGames)
	_, err := g.db.Exec(query, gameId)

	return err
}

func (g *GameRepository) UpdateGames(gameId int, game entities.UpdateGames) error {
	query := fmt.Sprintf("UPDATE %s SET title = $1, subtitle = $2, description = $3 WHERE id = $4", database.TableGames)
	_, err := g.db.Exec(query, game.Title, game.SubTitle, game.Description, gameId)

	return err
}

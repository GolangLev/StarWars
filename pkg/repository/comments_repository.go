package repository

import (
	"fmt"
	"github.com/GolangLev/Goland/StarWars/internal/database"
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/jmoiron/sqlx"
)

type CommentsRepository struct {
	db *sqlx.DB
}

func NewCommentsRepository(db *sqlx.DB) *CommentsRepository {
	return &CommentsRepository{db: db}
}

func (c *CommentsRepository) CreateComment(comment entities.Comments) (int, error) {
	var id int

	query := fmt.Sprintf("INSERT INTO %s (user_id, record_id, comment) VALUES ($1, $2, $3) RETURNING id", database.TableComments)
	row := c.db.QueryRow(query, comment.UserId, comment.RecordId, comment.Comment)
	if err := row.Scan(&id); err != nil {
		return 0, err
	}

	return id, nil
}

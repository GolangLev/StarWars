package repository

import (
	"fmt"
	"github.com/GolangLev/Goland/StarWars/internal/database"
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/jmoiron/sqlx"
)

type NewsRepository struct {
	db *sqlx.DB
}

func NewNewsRepository(db *sqlx.DB) *NewsRepository {
	return &NewsRepository{db: db}
}

func (n *NewsRepository) CreateNews(news entities.News) (int, error) {
	var id int

	query := fmt.Sprintf("INSERT INTO %s (title, subtitle, description) VALUES ($1, $2, $3) RETURNING id", database.TableNews)
	row := n.db.QueryRow(query, news.Title, news.SubTitle, news.Description)
	if err := row.Scan(&id); err != nil {
		return 0, err
	}

	return id, nil
}

func (n *NewsRepository) GetAllNews() ([]entities.News, error) {
	var news []entities.News

	query := fmt.Sprintf("SELECT * FROM %s ORDER BY id ASC", database.TableNews)
	err := n.db.Select(&news, query)

	return news, err
}

func (n *NewsRepository) GetNewsById(newsId int) (entities.News, error) {
	var news entities.News

	query := fmt.Sprintf("SELECT * FROM %s WHERE id = $1", database.TableNews)
	err := n.db.Get(&news, query, newsId)

	return news, err
}

func (n *NewsRepository) DeleteNews(newsId int) error {
	query := fmt.Sprintf("DELETE FROM %s WHERE id = $1", database.TableNews)
	_, err := n.db.Exec(query, newsId)
	return err
}

func (n *NewsRepository) UpdateNews(newsId int, news entities.UpdateNews) error {

	query := fmt.Sprintf("UPDATE %s SET title = $1, subtitle = $2, description = $3 WHERE id = $4", database.TableNews)
	_, err := n.db.Exec(query, news.Title, news.SubTitle, news.Description, newsId)

	return err
}

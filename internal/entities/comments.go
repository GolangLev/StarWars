package entities

type Comments struct {
	Id       int    `json:"id" db:"id"`
	UserId   int    `json:"user_Id" db:"user_Id"`
	RecordId int    `json:"record_id" db:"record_id"`
	Comment  string `json:"comment" db:"comment"`
}

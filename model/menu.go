package model

import (
	"github.com/jinzhu/gorm"
)

type Food struct {
	gorm.Model
	Foodid      int    `gorm:"primary_key"`
	Shopid      int    `gorm:"primary_key"`
	Foodname    string `json:"foodname"`
	Foodsize    string `json:"foodsize"`
	Foodsummary string `json:"foodsummary"`
	Foodgenre   string `json:"foodgenre"`
	Foodimage   string `json:"foodimage"`
	Foodprice   int    `json:"foodprice"`
}

type MenuWithFoodSummary struct {
	gorm.Model
	Menuid      int    `gorm:"primary_key"`
	Foodid      int    `gorm:"primary_key"`
	Shopid      int    `gorm:"primary_key"`
	Foodname    string `json:"foodname"`
	Foodsize    string `json:"foodsize"`
	Foodsummary string `json:"foodsummary"`
	Foodgenre   string `json:"foodgenre"`
	Foodimage   string `json:"foodprice"`
	Foodprice   int    `json:"foodprice"`
}

func GetFoodsByShopID(db *gorm.DB, Shopid uint) ([]Food, error) {
	foods := []Food{}
	if err := db.Find(&foods, "Shopid = ?", Shopid).Error; err != nil {
		return nil, err
	}
	return foods, nil
}

func GetFoodsByMenuID(db *gorm.DB, Menuid uint) ([]MenuWithFoodSummary, error) {
	menus := []MenuWithFoodSummary{}
	if err := db.Table("menus").Select("foods.*,menus.menuid").Joins("left join foods on menus.foodid = foods.foodid").Where("Menuid = ?", Menuid).Find(&menus).Error; err != nil {
		return nil, err
	}
	return menus, nil
}

func CreateFood(db *gorm.DB, food *Food) error {
	return db.Create(&food).Error
}

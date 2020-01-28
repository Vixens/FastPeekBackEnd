package controller

import (
	"CRUD_APP/model"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

func (s *Server) GetMenuHandler(c *gin.Context) {

	ShopID, err := strconv.Atoi(c.Param("shopid"))
	if err != nil {
		return
	}

	MenuID, err := strconv.Atoi(c.Param("menuid"))
	if err != nil {
		return
	}

	shopfoods, err := model.GetFoodsByShopID(s.DB, uint(ShopID))
	if err != nil {
		shopfoods = []model.Food{}
	}

	menufoods, err := model.GetFoodsByMenuID(s.DB, uint(MenuID))
	if err != nil {
		menufoods = []model.MenuWithFoodSummary{}
	}

	c.JSON(http.StatusOK, shopfoods)
	c.JSON(http.StatusOK, menufoods)
}
func (s *Server) NewMenuHandler(c *gin.Context) {
	food := new(model.Food)
	food.Shopid, _ = strconv.Atoi(c.Param("shopid"))
	c.BindJSON(&food)

	if err := model.CreateFood(s.DB, food); err != nil {
		c.HTML(http.StatusBadRequest, "new.tmpl", gin.H{
			"errMsg": "登録できませんでした	",
		})
		return
	}
}

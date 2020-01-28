package controller

import (
	"net/http"

	// "image/png"
	"CRUD_APP/model"

	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	// "github.com/boombuler/barcode"
	// "github.com/boombuler/barcode/qr"
)

type Server struct {
	DB *gorm.DB
}

func (s *Server) GetStorePage(c *gin.Context) {
	errMsg := ""
	stores, err := model.GetAllStores(s.DB)

	if err != nil {
		errMsg = "エラー発生"
		stores = []model.Store{}
	}
	c.JSON(http.StatusOK, gin.H{
		"stores": stores,
		"errMsg": &errMsg,
	})
}

func (s *Server) CreateStoreHandler(c *gin.Context) {
	store := new(model.Store)
	c.BindJSON(&store)

	if store.Storename == "" {
		c.HTML(http.StatusBadRequest, "new.tmpl", gin.H{
			"errMsg": "empty:Storename",
		})
		return
	} else if store.Loc == "" {
		c.HTML(http.StatusBadRequest, "new.tmpl", gin.H{
			"errMsg": "empty:Loc",
		})
		return
	} else if store.Genre == "" {
		c.HTML(http.StatusBadRequest, "new.tmpl", gin.H{
			"errMsg": "empty:Genre",
		})
		return
	} else if store.Tel == "" {
		c.HTML(http.StatusBadRequest, "new.tmpl", gin.H{
			"errMsg": "empty:Tel",
		})
		return
	} else if store.Information == "" {
		c.HTML(http.StatusBadRequest, "new.tmpl", gin.H{
			"errMsg": "empty:Information",
		})
		return
	} else if store.Tables == "" {
		c.HTML(http.StatusBadRequest, "new.tmpl", gin.H{
			"errMsg": "empty:Tables",
		})
		return
	}
	if err := model.CreateStore(s.DB, store); err != nil {
		c.HTML(http.StatusBadRequest, "new.tmpl", gin.H{
			"errMsg": "登録できませんでした	",
		})
		return
	}
	c.Redirect(http.StatusMovedPermanently, "/")
}

using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Model.ViewModel
{
    public class MagazineModel
    {
        public MagazineModel()
        {
            var magazineId = Guid.NewGuid();
            Magazine = new Resource_Magazine()
            {
                LineId = 1,
                MagazineId = magazineId,
                MagazineName = "Magazine 1",
                MagazineUrl = "",
                CreateDate = DateTime.Now,
                Audios = new List<Resource_Audio>()
                {
                    new Resource_Audio()
                    {
                        LineId = 1,
                        AudioId = Guid.NewGuid(),
                        AudioName = "CD Index (Trang 3)",
                        AudioUrl = "HotEnglish65_01_Hello.mp3",
                        MagazineId = magazineId,
                        CreateDate = DateTime.Now
                    },
                    new Resource_Audio()
                    {
                        LineId = 2,
                        AudioId = Guid.NewGuid(),
                        AudioName = "CD Track 2 - Australian man (Trang 6)",
                        AudioUrl = "HotEnglish65_02_Idioms.mp3",
                        MagazineId = magazineId,
                        CreateDate = DateTime.Now
                    },
                    new Resource_Audio()
                    {
                        LineId = 3,
                        AudioId = Guid.NewGuid(),
                        AudioName = "CD track 3 Englishman & Irishman (Trang 7)",
                        AudioUrl = "HotEnglish65_03_Jokes.mp3",
                        MagazineId = magazineId,
                        CreateDate = DateTime.Now
                    }
                }
            };
        }
        public Resource_Magazine Magazine { get; set; }

    }
}

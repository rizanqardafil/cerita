const questionsData = [
  {
    "level": 1,
    "question":
        "Kekerasan seksual adalah segala perilaku yang menyasar seksual seseorang tanpa persetujuan",
    "answers": "Betul,Salah",
    "rightAnswerIndex": 1,
    "image": null
  },
  {
    "level": 2,
    "question": "Memaksa teman menonton video porno termasuk pelecehan seksual",
    "answers": "Betul,Salah",
    "rightAnswerIndex": 1,
    "image": null
  },
  {
    "level": 3,
    "question":
        "Memperlihatkan alat kelamin pada orang lain tanpa persetujuan termasuk jenis pelecehan seksual",
    "answers": "Verbal,Fisik,Non fisik,Jejaring online",
    "rightAnswerIndex": 3,
    "image": null
  },
  {
    "level": 4,
    "question": "Kekerasan seksual berbentuk verbal diantaranya adalah",
    "answers":
        "Pemaksaan aborsi,Melontarkan lelucon bernuansa seksual pada seseorang,Pemberian hukuman bernuansa seksual,Mengambil foto/video tanpa persetujuan",
    "rightAnswerIndex": 2,
    "image": null
  },
  {
    "level": 5,
    "question": "Yang BUKAN termasuk kekerasan seksual adalah",
    "answers":
        "Pemaksaan perkawinan,Pelecehan seksual,Pemaksaan pendapat,Cat Calling",
    "rightAnswerIndex": 3,
    "image": null
  },
  {
    "level": 6,
    "question":
        "Menceritakan kegiatan seksual pribadi pada orang lain BUKAN termasuk pelecehan seksual",
    "answers": "Betul,Salah",
    "rightAnswerIndex": 2,
    "image": null
  },
  {
    "level": 7,
    "question":
        "Memaksa istri untuk berhubungan intim BUKAN termasuk kekerasan seksual",
    "answers": "Betul,Salah",
    "rightAnswerIndex": 2,
    "image": null
  },
  {
    "level": 8,
    "question":
        "Mengancam menyebarkan video pribadi termasuk pelecehan seksual",
    "answers": "Betul,Salah",
    "rightAnswerIndex": 2,
    "image": null
  },
  {
    "level": 9,
    "question":
        "Yang BUKAN termasuk dampak kekerasan seksual pada fisik adalah",
    "answers":
        "Cedera dan luka di tubuh,Penyakit menular seksual,Gangguan tidur,Kehamilan yang tidak dikehendaki",
    "rightAnswerIndex": 3,
    "image": null
  },
  {
    "level": 10,
    "question":
        "Siapa yang berpotensi melakukan kekerasan seksual? Pilih jawaban yang paling benar",
    "answers":
        "Orang tidak dikenal,Semua orang,Orang dengan riwayat pernah melakukan kekerasan seksual,Penyintas kekerasan dan pelecehan seksual",
    "rightAnswerIndex": 2,
    "image": null,
  },
  {
    "level": 11,
    "question":
        "Remaja 17 tahun mau diajak hubungan intim oleh orang dewasa, apakah hal ini termasuk kekerasan seksual?",
    "answers":
        "Bukan kekerasan seksual jika dilandasi suka sama suka,Termasuk kekerasan seksual,Bisa termasuk dan bisa juga bukan kekerasan seksual",
    "rightAnswerIndex": 2,
    "image": null
  },
  {
    "level": 12,
    "question":
        "Perasaan bersalah, malu, dan takut dipandang buruk oleh masyarakat termasuk dampak psikologis",
    "answers": "Betul,Salah",
    "rightAnswerIndex": 1,
    "image": null,
  },
  {
    "level": 13,
    "question":
        "Remaja korban kekerasan seksual tidak mau keluar rumah karena takut bertemu laki-laki dengan ciri tertentu termasuk dampak",
    "answers": "Fisik,Psikologis,Sosial",
    "rightAnswerIndex": 2,
    "image": null
  },
  {
    "level": 14,
    "question":
        "Remaja laki-laki korban kekerasan seksual enggan bersekolah karena takut dicap buruk oleh teman-temannya termasuk dampak",
    "answers": "Fisik,Psikologis,Sosial",
    "rightAnswerIndex": 3,
    "image": null,
  },
  {
    "level": 15,
    "question":
        "Kasus Harry wirawan yang telah melakukan kekerasan seksual sehingga korbannya mengalami kehamilan yang tidak dikehendaki termasuk contoh dampak",
    "answers": "Fisik,Psikologis,Sosial",
    "rightAnswerIndex": 1,
    "image": null,
  },
  {
    "level": 16,
    "question": "Secara biologis, manusia normal memiliki dorongan seksual",
    "answers": "Benar,Salah",
    "rightAnswerIndex": 1,
    "image": null
  },
  {
    "level": 17,
    "question":
        "Dorongan seksual bisa disalurkan dimanapun dan pada hal apapun",
    "answers": "Benar,Salah",
    "rightAnswerIndex": 2,
    "image": null
  },
  {
    "level": 18,
    "question":
        "Kekerasan seksual hanya terjadi jika hukum yang berlaku bagi pelaku tidak memberikan efek jera",
    "answers": "Benar,Salah",
    "rightAnswerIndex": 2,
    "image": null
  },
  {
    "level": 19,
    "question":
        "KDRT di rumah tangga yang mengarah pada kekerasan seksual umumnya terjadi karena",
    "answers":
        "Dorongan seksual atau biologis,Gangguan kejiwaan,Keinginan mendominasi,Takut ditinggalkan",
    "rightAnswerIndex": 2,
    "image": null
  },
  {
    "level": 20,
    "question": "Faktor penyebab terjadinya kekerasan seksual adalah",
    "answers":
        "Biologis,Psikologis,Sosial,A B dan C saling berkaitan satu sama lain ",
    "rightAnswerIndex": 4,
    "image": null,
  },
  {
    "level": 21,
    "question":
        "Kekerasan dan pelecehan seksual hanya dilakukan oleh orang asing",
    "answers": "Mitos,Fakta",
    "rightAnswerIndex": 1,
    "image": null
  },
  {
    "level": 22,
    "question": "Korban dapat menikmati pelecehan yang dilakukan pada dirinya",
    "answers": "Mitos,Fakta",
    "rightAnswerIndex": 1,
    "image": null
  },
  {
    "level": 23,
    "question":
        "Orang yang melakukan pelecehan biasanya orang terdekat dari korban",
    "answers": "Mitos,Fakta",
    "rightAnswerIndex": 2,
    "image": null,
  },
  {
    "level": 24,
    "question": "Laki-laki yang melecehkan laki-laki lain adalah gay",
    "answers": "Mitos,Fakta",
    "rightAnswerIndex": 1,
    "image": null
  },
  {
    "level": 25,
    "question":
        "Korban pelecehan seksual umumnya takut untuk melaporkan pelaku",
    "answers": "Mitos,Fakta",
    "rightAnswerIndex": 2,
    "image": null
  },
];

# Lost-And-Found-RealCuy

## Deskripsi Proyek
Lost and Found adalah layanan berbasis web yang mempertemukan orang yang sedang kehilangan barang dengan orang yang menemukan barang hilang di lingkungan Fakultas Teknik Universitas Indonesia. Dalam web, user dapat membuat post dan berkirim pesan secara privat, seperti media sosial yang kita kenal pada umumnya.

## Fitur
#### `Post`
Post memiliki struktur berupa teks, data dari sender post seperti username, waktu dan tanggal post dikirim, status dari post, jumlah rise vote serta username dan nama dari sender post. Teks berisi berita tentang hilang atau ditemukannya sesuatu. status berupa enum yang berisi keterangan apakah post tersebut tentang hilangnya barang atau ditemukannya barang. Post yang ada di timeline bisa di-upvote oleh semua user, di-share oleh semua user, dan di-delete oleh post maker/sender.

> Untuk saat ini, post hanya bisa memuat teks. Namun, dalam pengembangannya, diupayakan agar post bisa menyimpan gambar.

#### `Search`
Fitur search digunakan user untuk mencari post yang sesuai dengan keinginannya. User dapat menggunakan kata tertentu, username, atau nama user sebagai parameter dalam pencarian.

#### `Direct messages`
Direct messages adalah fitur yang memfasilitasi dua orang user untuk bertukar informasi secara privat.

Misal, ada seorang user yang kehilangan barang. User tersebut akan mencari post yang berisi tentang informasi ditemukannya sebuah barang. Jika user merasa barang yang dimaksud adalah miliknya, user bisa menghubungi pengirim dari post tersebut lewat direct messages untuk berdiskusi lebih lanjut mengenai ciri-ciri barang, detail kronologi penemuan barang, dan menentukan tanggal serah terima barang.

#### `Profile personalization`
Baik saat membuat akun atau setelahnya, user dapat menambahkan bio, memilih jurusan kuliah (terbatas pada jurusan di FTUI), membuat custom username dan nama pada profil (dengan constraints), dan menambahkan tanggal lahir.

## Bang Seratusnya Dong

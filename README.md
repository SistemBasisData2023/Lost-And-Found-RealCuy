<h1 style="text-align: center;">
Lost-And-Found-RealCuy
</h1>

## **Anggota Kelompok**
1. Luthfi Misbachul Munir - `2106631961`
2. Gemilang Bagas Ramadhani - `2006535205`
3. Ivan Indrastata Ramadhan - `2106706981`

## **Deskripsi Proyek**
Lost and Found adalah layanan berbasis web yang mempertemukan orang yang sedang kehilangan barang dengan orang yang menemukan barang hilang di lingkungan Fakultas Teknik Universitas Indonesia. Dalam web, user dapat membuat post dan berkirim pesan secara privat, seperti media sosial yang kita kenal pada umumnya.

**[PPT](https://docs.google.com/presentation/d/1XYxdtB4oQ1ArLhABHR6cDtf4JryidBxvhVW3k9nTUSc/edit?usp=sharing)**

# Fitur
### **Post**
```
Post memiliki struktur berupa teks, data dari sender post seperti username, waktu dan tanggal post dikirim, status dari post, jumlah rise vote serta username dan nama dari sender post. Teks berisi berita tentang hilang atau ditemukannya sesuatu. status berupa enum yang berisi keterangan apakah post tersebut tentang hilangnya barang atau ditemukannya barang. Post yang ada di timeline bisa di-upvote oleh semua user, di-share oleh semua user, dan di-delete oleh post maker/sender.

> Untuk saat ini, post hanya bisa memuat teks. Namun, dalam pengembangannya, diupayakan agar post bisa menyimpan gambar.
```
### **Search**
```
Fitur search digunakan user untuk mencari post yang sesuai dengan keinginannya. User dapat menggunakan kata tertentu, username, atau nama user sebagai parameter dalam pencarian.
```
### **Direct messages**
```
Direct messages adalah fitur yang memfasilitasi dua orang user untuk bertukar informasi secara privat.

Misal, ada seorang user yang kehilangan barang. User tersebut akan mencari post yang berisi tentang informasi ditemukannya sebuah barang. Jika user merasa barang yang dimaksud adalah miliknya, user bisa menghubungi pengirim dari post tersebut lewat direct messages untuk berdiskusi lebih lanjut mengenai ciri-ciri barang, detail kronologi penemuan barang, dan menentukan tanggal serah terima barang.
```
### **Profile personalization**
```
Baik saat membuat akun atau setelahnya, user dapat menambahkan bio, memilih jurusan kuliah (terbatas pada jurusan di FTUI), membuat custom username dan nama pada profil (dengan constraints), dan menambahkan tanggal lahir.
```
# Informasi tabel

Dalam database, terdapat 5 tabel, yaitu **`user_data`**, **`post`**, **`room_chat`**, **`chat`**, dan **`detail_chat`**.

### `user_data`
|user_id(PK)|email|password|username|name|bio|birth_date|jurusan_kuliah|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|

### `post`
|post_id(PK)|user_id(FK)|post_txt|rise_vote|post_date|status|
|:---:|:---:|:---:|:---:|:---:|:---:|

### `room_chat`
|id_room(PK)|person_1(FK)|person_2(FK)|created_at|
|:---:|:---:|:---:|:---:|

### `chat`
|chat_id(PK)|sender_id(FK)|receiver_id(FK)|sent_time|message|msg_status|
|:---:|:---:|:---:|:---:|:---:|:---:|

### `detail_chat`
|id_chat(PK)|id_room(FK)|sender(FK)|receiver(FK)|message|time|
|:---:|:---:|:---:|:---:|:---:|:---:|
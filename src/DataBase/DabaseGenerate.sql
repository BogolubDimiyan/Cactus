--=================================
--Author: Богданов Д.М.
--Data: Начало 19-03-2025
--Description: Структура базы данных для социальной сети "Cactus"
--=================================


-- добавить ограничения (уникальность, на соответствие дат, внешние ключи и т.д.)

create table Users 
(
	UserID bigserial primary key,
	UserGUID uuid,
	UserAlias varchar(15), -- как в телегрме уникальное имя пользователя, с помощью которого можно тегнуть
	UserName varchar(15),
	UsernSurname varchar(15),
	UserBirthDay date , -- Добавить проверку на дату (Возможно через функцию)
	UserPhone char(11), -- добавить проверку на уникальность
	UserEmail varchar(245), -- добавить проверку на уникальность
	UserPassword varchar(30), -- Добавить Проверку на длину пароля (не меньше 5 символов)
	UserPhoto text, --Хранит путь на файл в файловой системе
	StickerID bigint, -- !!потом разобраться более детально!!
)

create table Communities
(
	CommunityID bigserial primary key,
	CommunityGUID uuid,
	CommunityUsersLists bigint, -- Пользователи, состоящие в сообществе: юзеры, админы, владельцы
	CommunityName varchar(30),
	CommunityDescription varchar(700),
	CommunityOwner bigint, -- Пользователь, который владелец сообщества; заполняется приложением
	CommunityAdmin bigint, -- Пользователи, которые админы сообщества; заполняется приложением
)

create table Posts
(
	PostID bigserial primary key,
	PostGUID uuid,
	UserID bigint,
	CommunityPosts bigint,
	PostPhoto text, -- поле хранит ссылку на файл в файловой системе; заполняется приложением
	PostVideo text, -- поле хранит ссылку на файл в файловой системе; заполняется приложением
	PostText varchar(1000),
	PostTime time
)

create table UsersChats
(
	ChatID bigserial primary key,
	ChatGUID uuid,
	UserID bigint,
)

create table ChatGroups
(
	ChatGroupID bigserial primary key,
	ChatGroupGUID uuid,
	UserID bigint,
	ChatGroupName varchar(30),
	ChatGroupDescription varchar(700),
)

create table Messages
(
	MessageID bigint primary key,
	MesssageGUID uuid,
	UserID bigint
	MessageText text,
	MessageTime timestamp,
	MessagePhoto text,
	MessageVideo text,
	EmojiID int,
	--GifID bigint,
	StickerID bigint
)

create table UsersLikes -- заполняется после того, как пользователь поставил лайк
(
	UsersLikeID bigserial primary key,
	UsersLikeGUID uuid,
	UserID bigint,
	PostID bigint,
)

create table Emojis
(
	EmojiID serial primary key,
	Emoji text, -- поле для хранения самих смайликов
)

-- нужны ли вообще? Их особо не используют...
-- create table Gifs
-- (
-- 	GifID bigserial primary key,
-- 	GifsPath text,
-- )

create table Stickers
(
	StickerID bigserial primary key,
	StickerPath text -- поле для хранения самих стикеров
)





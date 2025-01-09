
-- 创建库
create database if not exists visen;

-- 切换库
use visen;

insert into question_bank (title, description, picture, userId, isDelete) values
('Math ', 'A collection of basic math questions', 'math_pic1.png', 1, 0),
('Science ', 'Various questions related to science', 'science_pic1.png', 2, 0),
('History Knowledge', 'History questions and answers', 'history_pic1.png', 3, 0),
('English Vocabulary', 'Vocabulary test for English learners', 'english_pic1.png', 4, 0),
('Geography Quiz', 'A set of geography-related questions', 'geo_pic1.png', 5, 0),
('Programming Challenges', 'Programming questions for practice', 'prog_pic1.png', 6, 0),
('Chinese Culture', 'Questions about Chinese traditions and culture', 'china_pic1.png', 7, 0),
('Physics Test', 'Advanced physics questions', 'physics_pic1.png', 8, 0),
('Literature Quiz', 'Literary works and their analysis', 'literature_pic1.png', 9, 0),
('Music Knowledge', 'General music knowledge quiz', 'music_pic1.png', 10, 0),
('Art and Design', 'Questions about famous art and designers', 'art_pic1.png', 11, 0),
('Travel Quiz', 'Questions about popular travel destinations', 'travel_pic1.png', 12, 0),
('Sports Trivia', 'Sports-related questions for trivia lovers', 'sports_pic1.png', 13, 0),
('Technology Facts', 'Latest facts in technology', 'tech_pic1.png', 14, 0),
('Cooking Quiz', 'Questions about food and recipes', 'food_pic1.png', 15, 0),
('Health and Wellness', 'Health-related questions', 'health_pic1.png', 16, 0),
('Current Affairs', 'Latest news and events', 'news_pic1.png', 17, 0),
('Animal Kingdom', 'Questions about animals and nature', 'animal_pic1.png', 18, 0),
('Movies and TV', 'Famous movie and TV show trivia', 'movie_pic1.png', 19, 0);


insert into question (title, content, tags, answer, userId, isDelete) values
('Math Question 1', 'What is 2 + 2?', '["math"]', '4', 1, 0),
('Math Question 2', 'What is 5 * 5?', '["math"]', '25', 1, 0),
('Science Question 1', 'What is H2O?', '["science"]', 'Water', 2, 0),
('Science Question 2', 'What planet is closest to the sun?', '["science"]', 'Mercury', 2, 0),
('History Question 1', 'Who was the first president of the United States?', '["history"]', 'George Washington', 3, 0),
('History Question 2', 'In which year did the Titanic sink?', '["history"]', '1912', 3, 0),
('English Question 1', 'What is the synonym of "happy"?', '["english"]', 'Joyful', 4, 0),
('English Question 2', 'What is the opposite of "success"?', '["english"]', 'Failure', 4, 0),
('Geography Question 1', 'What is the capital of France?', '["geography"]', 'Paris', 5, 0),
('Geography Question 2', 'Which continent is Australia on?', '["geography"]', 'Australia', 5, 0),
('Programming Question 1', 'What is the output of print(2+3)?', '["programming"]', '5', 6, 0),
('Programming Question 2', 'Which language is used for Android development?', '["programming"]', 'Java', 6, 0),
('Chinese Culture Question 1', 'What is the national animal of China?', '["china"]', 'Giant Panda', 7, 0),
('Chinese Culture Question 2', 'What is the traditional Chinese New Year food?', '["china"]', 'Dumplings', 7, 0),
('Physics Question 1', 'What is the force that keeps us on the ground?', '["physics"]', 'Gravity', 8, 0),
('Physics Question 2', 'What is the speed of light?', '["physics"]', '299,792,458 m/s', 8, 0),
('Literature Question 1', 'Who wrote "Romeo and Juliet"?', '["literature"]', 'William Shakespeare', 9, 0),
('Literature Question 2', 'What is the name of the wizard in "Harry Potter"?', '["literature"]', 'Harry Potter', 9, 0),
('Music Question 1', 'Who composed "Fur Elise"?', '["music"]', 'Beethoven', 10, 0),
('Music Question 2', 'What is the musical instrument with black and white keys?', '["music"]', 'Piano', 10, 0);

insert into question_bank_question (questionBankId, questionId, userId) values
(1, 1, 1),
(1, 2, 1),
(2, 3, 2),
(2, 4, 2),
(3, 5, 3),
(3, 6, 3),
(4, 7, 4),
(4, 8, 4),
(5, 9, 5),
(5, 10, 5),
(6, 11, 6),
(6, 12, 6),
(7, 13, 7),
(7, 14, 7),
(8, 15, 8),
(8, 16, 8),
(9, 17, 9),
(9, 18, 9),
(10, 19, 10),
(10, 20, 10),
(11, 21, 11);
insert into user (userAccount, userPassword, unionId, mpOpenId, userName, userAvatar, userProfile, userRole, isDelete) values
('user21', 'password21', 'unionId21', 'mpOpenId21', 'Alice Zhang', 'avatar21.png', 'Profile of Alice Zhang', 'user', 0),
('user22', 'password22', 'unionId22', 'mpOpenId22', 'John Doe', 'avatar22.png', 'John\'s profile', 'admin', 0),
('user23', 'password23', 'unionId23', 'mpOpenId23', '王飞', 'avatar23.png', '王飞的简介', 'user', 0),
('user24', 'password24', 'unionId24', 'mpOpenId24', 'Emma White', 'avatar24.png', 'Emma\'s profile', 'ban', 0),
('user25', 'password25', 'unionId25', 'mpOpenId25', 'George King', 'avatar25.png', 'George\'s profile', 'user', 0),
('user27', 'password27', 'unionId27', 'mpOpenId27', 'Sophia Brown', 'avatar27.png', 'Sophia\'s profile', 'user', 0);

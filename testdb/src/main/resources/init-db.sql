INSERT INTO category(category_id, category_name) VALUES (1, 'День рождения');
INSERT INTO category(category_id, category_name) VALUES (2, 'Праздник');
INSERT INTO category(category_id, category_name) VALUES (3, 'Надо платить');
INSERT INTO category(category_id, category_name) VALUES (4, 'Запросить данные');
INSERT INTO category(category_id, category_name) VALUES (5, 'Контроль чего-то');
INSERT INTO category(category_id, category_name) VALUES (6, 'Прочее');

INSERT INTO expense(expense_id, date, category_id, price) VALUES (1, '2021-10-01', 1, 25.4);
INSERT INTO expense(expense_id, date, category_id, price) VALUES (2, '2021-10-01', 3, 7);
INSERT INTO expense(expense_id, date, category_id, price) VALUES (3, '2021-10-02', 5, 60);
INSERT INTO expense(expense_id, date, category_id, price) VALUES (4, '2021-10-02', 1, 15);
INSERT INTO expense(expense_id, date, category_id, price) VALUES (5, '2021-10-02', 2, 22.5);
INSERT INTO expense(expense_id, date, category_id, price) VALUES (6, '2021-10-03', 4, 30);
INSERT INTO expense(expense_id, date, category_id, price) VALUES (7, '2021-11-04', 1, 50);
INSERT INTO expense(expense_id, date, category_id, price) VALUES (8, '2021-11-04', 1, 5);


INSERT INTO event(event_id, date, category_id, comment) VALUES (1, '2022-02-14', 2, 'день Валентина!');
INSERT INTO event(event_id, date, category_id, comment) VALUES (2, '2011-02-13', 1, 'др. Коли');
INSERT INTO event(event_id, date, category_id, comment) VALUES (3, '2022-09-04', 3, 'счета ПЭС');
INSERT INTO event(event_id, date, category_id, comment) VALUES (4, '2022-12-04', 3, 'счета DD');
INSERT INTO event(event_id, date, category_id, comment) VALUES (5, '2022-07-22', 3, 'оплата кредита');
INSERT INTO event(event_id, date, category_id, comment) VALUES (6, '2022-04-24', 5, 'звонок коллектора');

INSERT INTO user(user_id, user_name , telegram_id) VALUES (1, 'tester', 22121222);

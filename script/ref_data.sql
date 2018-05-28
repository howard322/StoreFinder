INSERT INTO product_ref(code, name, description) VALUES
  ('APPLE', 'Apple', 'An Apple'),
  ('ORANGE', 'Orange', 'An Orange'),
  ('BANANA', 'Banana', 'A Banana'),
  ('STRAWBERRY', 'Strawberry', 'A Strawberry'),
  ('MANGO', 'Mango', 'A Mango'),
  ('PAPAYA', 'Papaya', 'A Papaya'),
  ('KIWI', 'Kiwi', 'A Kiwi'),
  ('LYCHEE', 'Lychee', 'A Lychee');

INSERT INTO locations (loc_id, name, parent_loc) VALUES
  (1, 'Manila City', 1),
  (2, 'Quezon City', 2),
  (3, 'Makati City', 3),
  (4, 'Taguig City', 4),
  (5, 'Sampaloc', 1);
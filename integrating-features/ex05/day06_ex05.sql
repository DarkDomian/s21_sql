COMMENT ON TABLE person_discounts
IS 'Stores personalized discount programs to enhance customer loyalty and increase repeat business';

COMMENT ON COLUMN person_discounts.id
IS 'Unique identifier for each discount record (Primary Key)';

COMMENT ON COLUMN person_discounts.person_id
IS 'References the customer who receives the discount (Foreign Key to person table)';

COMMENT ON COLUMN person_discounts.pizzeria_id
IS 'References the pizzeria where discount is valid (Foreign Key to pizzeria table)';

COMMENT ON COLUMN person_discounts.discount
IS 'Personalized discount percentage (0-100) based on customer order history';
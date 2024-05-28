CREATE TABLE laboratory (
    lab_id INT PRIMARY KEY,
    lab_name VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);

CREATE TABLE scientist (
    scientist_id INT PRIMARY KEY,
    lab_id INT,
    scientist_name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255),
    FOREIGN KEY (lab_id) REFERENCES laboratory(lab_id)
);

CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY,
    lab_id INT,
    equipment_name VARCHAR(255) NOT NULL,
    quantity INT,
    FOREIGN KEY (lab_id) REFERENCES laboratory(lab_id)
);

CREATE TABLE experiment (
    experiment_id INT PRIMARY KEY,
    scientist_id INT,
    experiment_name VARCHAR(255) NOT NULL,
    equipment_id INT,
    status VARCHAR(50),
    FOREIGN KEY (scientist_id) REFERENCES scientist(scientist_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
);

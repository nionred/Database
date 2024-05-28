--laboratory table
INSERT INTO laboratory (lab_id, lab_name, location) VALUES (2, 'Physics Lab', 'Building B');
INSERT INTO laboratory (lab_id, lab_name, location) VALUES (3, 'Biology Lab', 'Building C');
INSERT INTO laboratory (lab_id, lab_name, location) VALUES (4, 'Computer Lab', 'Building D');
INSERT INTO laboratory (lab_id, lab_name, location) VALUES (5, 'Engineering Lab', 'Building E');
INSERT INTO laboratory (lab_id, lab_name, location) VALUES (1, 'Chemistry Lab', 'Building A');


-- scientist table
INSERT INTO scientist (scientist_id, lab_id, scientist_name, specialization) VALUES (1, 1, 'John Smith', 'Organic Chemistry');
INSERT INTO scientist (scientist_id, lab_id, scientist_name, specialization) VALUES (2, 1, 'Alice Johnson', 'Physical Chemistry');
INSERT INTO scientist (scientist_id, lab_id, scientist_name, specialization) VALUES (3, 2, 'Michael Brown', 'Quantum Physics');
INSERT INTO scientist (scientist_id, lab_id, scientist_name, specialization) VALUES (4, 3, 'Emily Davis', 'Microbiology');
INSERT INTO scientist (scientist_id, lab_id, scientist_name, specialization) VALUES(5, 4, 'David Wilson', 'Computer Science');


-- equipment table
INSERT INTO equipment (equipment_id, lab_id, equipment_name, quantity) VALUES (1, 1, 'Microscope', 5);
INSERT INTO equipment (equipment_id, lab_id, equipment_name, quantity) VALUES (2, 1, 'Bunsen Burner', 3);
INSERT INTO equipment (equipment_id, lab_id, equipment_name, quantity) VALUES (3, 2, 'Particle Accelerator', 1);
INSERT INTO equipment (equipment_id, lab_id, equipment_name, quantity) VALUES (4, 3, 'PCR Machine', 2);
INSERT INTO equipment (equipment_id, lab_id, equipment_name, quantity) VALUES (5, 4, 'Desktop Computer', 10);

--experiment table
INSERT INTO experiment (experiment_id, scientist_id, experiment_name, equipment_id, status) VALUES (1, 1, 'Organic Reaction Kinetics', 1, 'In Progress');
 INSERT INTO experiment (experiment_id, scientist_id, experiment_name, equipment_id, status) VALUES(2, 2, 'Quantum Entanglement Experiment', 3, 'Completed');
 INSERT INTO experiment (experiment_id, scientist_id, experiment_name, equipment_id, status) VALUES (3, 3, 'Microbial Culture Study', 4, 'Pending Approval');
 INSERT INTO experiment (experiment_id, scientist_id, experiment_name, equipment_id, status) VALUES (4, 4, 'Gene Expression Analysis', 4, 'In Progress');
 INSERT INTO experiment (experiment_id, scientist_id, experiment_name, equipment_id, status) VALUES (5, 5, 'Algorithm Optimization', 5, 'Completed');

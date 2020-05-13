CREATE TABLE Car
(
    car_id NUMBER(9) NOT NULL,
    model_id NUMBER(9) NOT NULL,
    production_date DATE NOT NULL,
    VIN_number VARCHAR2(24) NOT NULL,
    CONSTRAINT car_id_PK PRIMARY KEY (car_id),
    CONSTRAINT model_fk_car 
        FOREIGN KEY (model_id)
        REFERENCES Model(model_id)
);

CREATE TABLE Orders
(
    car_id NUMBER(9) NOT NULL,
    client_id NUMBER(9) NOT NULL,
    order_id NUMBER(9) NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT order_id_PK PRIMARY KEY (order_id),
    CONSTRAINT order_fk_car 
        FOREIGN KEY (car_id)
        REFERENCES Car(car_id),
    CONSTRAINT order_fk_client
        FOREIGN KEY (client_id)
        REFERENCES Client(client_id)
);

CREATE TABLE Client
(
    client_id NUMBER(9) NOT NULL,
    passport_number VARCHAR2(8) NOT NULL,
    firstname VARCHAR2(24) NOT NULL,
    lastname VARCHAR2(40) NOT NULL,
    gmail VARCHAR2(40) NOT NULL,
    client_password NUMBER(7) NOT NULL,
    address VARCHAR2(40) NOT NULL,
    CONSTRAINT client_id_PK PRIMARY KEY (client_id),
    CONSTRAINT passport_number_uk UNIQUE (passport_number)
);

CREATE TABLE Model 
(
    model_id NUMBER(9) NOT NULL,
    brand VARCHAR2(12) NOT NULL,
    model_name VARCHAR2(24) NOT NULL,
    version_id NUMBER(9) NOT NULL,
    engine_id NUMBER(9) NOT NULL,
    color_id NUMBER(9) NOT NULL,
    gearbox_id NUMBER(9) NOT NULL,
    base_price NUMBER(6,2) NOT NULL,
    full_price NUMBER(6,2) NOT NULL,
    kredit_price NUMBER(6,2) NOT NULL,
    CONSTRAINT model_id_PK PRIMARY KEY (model_id),
    CONSTRAINT version_fk_model
        FOREIGN KEY (version_id)
        REFERENCES Version(version_id),
    CONSTRAINT engine_fk_model
        FOREIGN KEY (engine_id)
        REFERENCES Engine(engine_id),
    CONSTRAINT color_fk_model
        FOREIGN KEY (color_id)
        REFERENCES Color(color_id),
    CONSTRAINT gearbox_fk_model 
        FOREIGN KEY (gearbox_id)
        REFERENCES Gearbox(gearbox_id)
);

CREATE TABLE Version
(
    version_id NUMBER(9) NOT NULL,
    code VARCHAR2(12) NOT NULL,
    name VARCHAR2(12) NOT NULL,
    description VARCHAR2(40) NOT NULL,
    price NUMBER(6,2) NOT NULL,
    CONSTRAINT version_id_PK PRIMARY KEY (version_id)     
);

CREATE TABLE Engine
(
    engine_id NUMBER(9) NOT NULL,
    code VARCHAR2(12) NOT NULL,
    power NUMBER(4) NOT NULL,
    torque NUMBER(5) NOT NULL,
    price NUMBER(9,2) NOT NULL,
    CONSTRAINT engine_id_PK PRIMARY KEY (engine_id)
);

CREATE TABLE Color
(
    color_id NUMBER(9) NOT NULL,
    name VARCHAR2(12) NOT NULL,
    code VARCHAR2(12) NOT NULL,
    CONSTRAINT color_id_PK PRIMARY KEY (color_id)
);

CREATE TABLE Gearbox
(
    gearbox_id NUMBER(9) NOT NULL,
    type VARCHAR2(12) NOT NULL,
    code VARCHAR2(12) NOT NULL,
    name VARCHAR2(24) NOT NULL,
    price NUMBER(6,2) NOT NULL,
    CONSTRAINT gearbox_id_PK PRIMARY KEY (gearbox_id)
);


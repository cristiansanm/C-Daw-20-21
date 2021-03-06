CREATE TABLE PERSONAL_EN_AVION(
	PEA_VUELOS VARCHAR(40) NOT NULL,
    PEA_idPILOTO INT NOT NULL,
    PEA_idCPIL INT NOT NULL,
    PEA_idING INT NOT NULL,
    PEA_idAUX INT NOT NULL,
    FECHA_VUELO DATE NOT NULL,
    primary key (PEA_VUELOS, PEA_idPILOTO, PEA_idCPIL, PEA_idING, PEA_idAUX),
    INDEX fk_PERSONAL_EN_AVION_PERSONAL1_idx (PEA_idPILOTO, PEA_idCPIL, PEA_idING, PEA_idAUX) visible,
    CONSTRAINT fk_VUELOS_PEA
		foreign key (PEA_VUELOS)
        references VUELOS (idVUELOS)
        ON DELETE NO ACTION
        on update NO ACTION,
	CONSTRAINT fk_PERSONAL_PILOTO
		foreign key (PEA_idPILOTO)
        REFERENCES PERSONAL (idPERSONAL)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
	CONSTRAINT fk_PERSONAL_COPILOTO
		foreign key (PEA_idCPIL)
        REFERENCES PERSONAL (idPERSONAL)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
	CONSTRAINT fk_PERSONAL_INGENIERO
		foreign key (PEA_idING)
        REFERENCES PERSONAL (idPERSONAL)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
	CONSTRAINT fk_PERSONAL_AUXILIAR
		foreign key (PEA_idAUX)
        REFERENCES PERSONAL (idPERSONAL)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    )
    ENGINE=InnoDB;
    
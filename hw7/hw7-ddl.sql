# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;

SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skill_id int NOT NULL,
    skill_name varchar(255) NOT NULL,
    skill_desc varchar(255) NOT NULL,
    skill_tag varchar(255) NOT NULL,
    skill_url varchar(255),
    skill_timeCommit int,
    PRIMARY KEY (skill_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (skill_id,skill_name,skill_desc,skill_tag) 
values (1,"bowling","The ancient chinese art of bowling","Skill 1"),
(2,"juggling","surprisingly dexterous","Skill 2"),
(3,"lacrosse","The wild west art of organized sports","Skill 1"),
(4,"tennis","sports but also flavored play-doh","Skill 1"), 
(5,"guitar_playing","good if you're good at it","Skill 2"),
(6,"sculpting","painting is for suckers","Skill 2"),
(7,"coding","110101010101111","Skill 3"),
(8,"database_design","I've heard there are classes for this","Skill 3");


# Section 4
# Create people(id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    first_name varchar(255),
    last_name varchar(255) NOT NULL,
    email varchar(255),
    linkedin_url varchar(255), 
    headshot_url varchar(255), 
    discord_handle varchar(255), 
    brief_bio varchar(255), 
    date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) values 
(1,"david",'Person 1',"david@compuserve.net"," linkedin.com/in/david","headshot.com/david","david#1234","Experienced software engineer with a passion for AI","2022-05-15"),
(2,"emily",'Person 2',"emily@compuserve.net"," linkedin.com/in/emily","headshot.com/emily","emily#1234","Marketing specialist with a focus on digital strategies",'2023-02-28'),
(3,"alex",'Person 3',"alex@compuserve.net"," linkedin.com/in/alex","headshot.com/alex","alex#1234","Data scientist enthusiastic about machine learning",'2022-09-10'),
(4,"micheal",'Person 4',"micheal@compuserve.net"," linkedin.com/in/micheal","headshot.com/micheal","micheal#1234","Financial analyst with expertise in risk management",'2023-01-03'),
(5,"lauren",'Person 5',"lauren@compuserve.net"," linkedin.com/in/lauren","headshot.com/lauren","lauren#1234","Graphic designer passionate about creating impactful visuals",'2023-03-18'),
(6,"samantha",'Person 6',"samantha@compuserve.net"," linkedin.com/in/samantha","headshot.com/samantha","samantha#1234","Environmental activist and sustainability advocate",'2022-11-05'),
(7,"joe",'Person 7',"joe@compuserve.net"," linkedin.com/in/joe","headshot.com/joe","joe#1234","Joe MAMA",'2019-11-06'),
(8,"calvin",'Person 8',"calvin@compuserve.net"," linkedin.com/in/calvin","headshot.com/calvin","calvin#1234","MEGATRON",'2012-12-12'),
(9,"rachel",'Person 9',"rachel@compuserve.net"," linkedin.com/in/rachel","headshot.com/rachel","rachel#1234","I haven't heard nice things",'2022-2-02'),
(10,"jay",'Person 10',"jay@compuserve.net"," linkedin.com/in/jay","headshot.com/jay","jay#1234","experienced swordsman in case of duel",'2023-10-05');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int NOT NULL AUTO_INCREMENT,
    skill_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills (people_id,skill_id,date_acquired) values 
(1,1,"2023-01-15"), 
(1,3,"2023-02-28"),
(1,6,"2022-04-07"),
(2,3,"2022-05-17"),
(2,4,"2020-09-03"),
(2,5,"2019-02-01"),
(3,1,"2020-04-14"),
(3,5,"2021-03-12"),
(5,3,"2022-06-11"),
(5,6,"2021-02-22"),
(6,2,"2022-02-19"),
(6,3,"2023-03-17"),
(6,4,"2021-04-16"),
(7,3,"2019-04-13"),
(7,5,"2018-04-06"),
(7,6,"2023-08-30"),
(8,1,"2022-07-25"),
(8,3,"2018-12-14"),
(8,5,"2016-11-22"),
(8,6,"2017-05-19"),
(9,2,"2020-03-20"),
(9,5,"2021-01-22"),
(9,6,"2023-02-16"),
(10,1,"2019-10-04"),
(10,4,"2016-08-07"),
(10,5,"2022-05-13");

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles(
    role_id int,
    role_name varchar(255),
    sort_priority int,
    PRIMARY KEY (role_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (role_id, role_name,sort_priority) values 
(1,'Designer',10),
(2,'Developer',20),
(3,'Recruit',30),
(4,'Team Lead',40),
(5,'Boss',50),
(6,'Mentor',60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles(
    peopleroles_id int NOT NULL AUTO_INCREMENT,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date NOT NULL,
    PRIMARY KEY (peopleroles_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id,role_id,date_assigned) values
(1,2,'2023-11-12'),
(2,5,'2023-11-12'),
(2,6,'2023-11-12'),
(3,2,'2023-11-12'),
(3,4,'2023-11-12'),
(4,3,'2023-11-12'),
(5,3,'2023-11-12'),
(6,2,'2023-11-12'),
(6,1,'2023-11-12'),
(7,1,'2023-11-12'),
(8,1,'2023-11-12'),
(8,4,'2023-11-12'),
(9,2,'2023-11-12'),
(10,1,'2023-11-12'),
(10,2,'2023-11-12');


CREATE DATABASE HQTCSDL;
GO

USE HQTCSDL;
GO

-- Khởi tạo các bảng 
CREATE TABLE attributes (
	id int NOT NULL,
	attributes_name varchar(50) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE brands(
	id int NOT NULL,
	brandsName varchar(50) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE genders (
	id int NOT NULL,
	gendersName varchar(50) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE categories (
	id int NOT NULL,
	categoriesName varchar(50) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE order_status (
	id int NOT NULL,
	orderStatusName varchar(10) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE product_status (
	id int NOT NULL ,
	productStatusName varchar(10) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE role_user (
	id int NOT NULL ,
	roleUserName varchar(10) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE user_status (
	id int NOT NULL ,
	userStatusName varchar(50) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE voucher_scope (
	id int NOT NULL ,
	voucherScopeName varchar(20) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE voucher_status (
	id int NOT NULL ,
	voucherStatusName varchar(20) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE voucher_type (
	id int NOT NULL ,
	voucherTypeName varchar(20) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE products (
	id int NOT NULL,
	productsName varchar(255) NOT NULL,
	brandID int NOT NULL,
	productsDescription varchar(255) NOT NULL,
	categoryID int NOT NULL,
	price float NOT NULL,
	discount float NOT NULL,
	lastUpdated date NOT NULL DEFAULT GETDATE(),
	amountSold int NOT NULL DEFAULT 0,
	statusID int NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT products_ibfk_1 FOREIGN KEY (brandID) REFERENCES brands (id),
	CONSTRAINT products_ibfk_2 FOREIGN KEY (categoryID) REFERENCES categories (id),
	CONSTRAINT products_ibfk_3 FOREIGN KEY (statusID) REFERENCES product_status (id)
)
GO

CREATE TABLE product_details (
	productID int NOT NULL,
	attributeID int NOT NULL,
	productDetailsValue varchar(50) NOT NULL,
	PRIMARY KEY (productID,attributeID),
	CONSTRAINT product_details_ibfk_1 FOREIGN KEY (productID) REFERENCES products (id),
	CONSTRAINT product_details_ibfk_2 FOREIGN KEY (attributeID) REFERENCES attributes (id)
)
GO

CREATE TABLE product_models (
	id int NOT NULL,
	productID int NOT NULL,
	optionValue varchar(50) NOT NULL,
	statusID int NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT product_models_ibfk_1 FOREIGN KEY (productID) REFERENCES products (id),
	CONSTRAINT product_models_ibfk_2 FOREIGN KEY (statusID) REFERENCES product_status (id)
)
GO

CREATE TABLE users (
	id varchar(20) NOT NULL,
	email varchar(100) NOT NULL,
	phone varchar(15) NOT NULL,
	encryptedPassword varchar(30) NOT NULL,
	fullName varchar(50) NOT NULL,
	genderID int NOT NULL,
	dob date DEFAULT NULL,
	roleID int NOT NULL,
	usersAddress varchar(255) NOT NULL,
	statusID int NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT users_ibfk_1 FOREIGN KEY (statusID) REFERENCES user_status (id),
	CONSTRAINT users_ibfk_2 FOREIGN KEY (genderID) REFERENCES genders (id),
	CONSTRAINT users_ibfk_3 FOREIGN KEY (roleID) REFERENCES role_user (id)
)
GO

CREATE TABLE vouchers (
	id int NOT NULL ,
	voucherCode varchar(20) NOT NULL,
	dateStart date NOT NULL,
	dateEnd date NOT NULL,
	discount float NOT NULL DEFAULT 0,
	typeID int NOT NULL,
	scopeID int NOT NULL,
	statusID int NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT vouchers_ibfk_1 FOREIGN KEY (statusID) REFERENCES voucher_status (id),
	CONSTRAINT vouchers_ibfk_2 FOREIGN KEY (typeID) REFERENCES voucher_type (id),
	CONSTRAINT vouchers_ibfk_3 FOREIGN KEY (scopeID) REFERENCES voucher_scope (id)
)
GO

CREATE TABLE  brand_vouchers (
	voucherID int NOT NULL,
	brandID int NOT NULL,
	PRIMARY KEY (voucherID,brandID),
	CONSTRAINT brand_vouchers_ibfk_1 FOREIGN KEY (voucherID) REFERENCES vouchers (id),
	CONSTRAINT brand_vouchers_ibfk_2 FOREIGN KEY (brandID) REFERENCES brands (id)
)
GO

CREATE TABLE catery_vouchers (
	voucherID int NOT NULL,
	categoryID int NOT NULL,
	PRIMARY KEY (voucherID,categoryID),
	CONSTRAINT catery_vouchers_ibfk_1 FOREIGN KEY (voucherID) REFERENCES vouchers (id),
	CONSTRAINT catery_vouchers_ibfk_2 FOREIGN KEY (categoryID) REFERENCES categories (id)
)
GO


CREATE TABLE product_vouchers (
	voucherID int NOT NULL,
	productID int NOT NULL,
	PRIMARY KEY (voucherID,productID),
	CONSTRAINT product_vouchers_ibfk_1 FOREIGN KEY (voucherID) REFERENCES vouchers (id),
	CONSTRAINT product_vouchers_ibfk_2 FOREIGN KEY (productID) REFERENCES products (id)
)
GO

CREATE TABLE rates (
	userID varchar(20) NOT NULL,
	productID int NOT NULL,
	lastUpdated date NOT NULL,
	ratePoint int NOT NULL,
	rateComment varchar(100) DEFAULT NULL,
	PRIMARY KEY (userID,productID),
	CONSTRAINT rates_ibfk_1 FOREIGN KEY (userID) REFERENCES users (id),
	CONSTRAINT rates_ibfk_2 FOREIGN KEY (productID) REFERENCES products (id)
)
GO

CREATE TABLE unknown_vouchers (
	voucherID int NOT NULL,
	remain int NOT NULL DEFAULT 0,
	PRIMARY KEY (voucherID),
	CONSTRAINT unknown_vouchers_ibfk_1 FOREIGN KEY (voucherID) REFERENCES vouchers (id)
)
GO


CREATE TABLE orders (
	id int NOT NULL ,
	userID varchar(20) DEFAULT NULL,
	dateCreated date NOT NULL,
	lastUpdated date NOT NULL,
	phone varchar(15) NOT NULL,
	address varchar(255) NOT NULL,
	statusID int NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT orders_ibfk_1 FOREIGN KEY (userID) REFERENCES users (id),
	CONSTRAINT orders_ibfk_2 FOREIGN KEY (statusID) REFERENCES order_status (id)
)
GO

CREATE TABLE used_vouchers (
	userID varchar(20) NOT NULL,
	voucherID int NOT NULL,
	orderID int NOT NULL,
	PRIMARY KEY (userID,voucherID),
	CONSTRAINT used_vouchers_ibfk_1 FOREIGN KEY (userID) REFERENCES users (id),
	CONSTRAINT used_vouchers_ibfk_2 FOREIGN KEY (voucherID) REFERENCES vouchers (id),
	CONSTRAINT used_vouchers_ibfk_3 FOREIGN KEY (orderID) REFERENCES orders (id)
)
GO

CREATE TABLE order_details (
	orderID int NOT NULL,
	modelID int NOT NULL,
	price float NOT NULL,
	discount float NOT NULL,
	quantity int NOT NULL,
	PRIMARY KEY (orderID,modelID),
	CONSTRAINT order_details_ibfk_1 FOREIGN KEY (orderID) REFERENCES orders (id),
	CONSTRAINT order_details_ibfk_2 FOREIGN KEY (modelID) REFERENCES product_models (id)
)
GO

CREATE TABLE personal_vouchers (
	voucherID int NOT NULL,
	userID varchar(20) NOT NULL,
	PRIMARY KEY (voucherID),
	CONSTRAINT personal_vouchers_ibfk_1 FOREIGN KEY (voucherID) REFERENCES vouchers (id),
	CONSTRAINT personal_vouchers_ibfk_2 FOREIGN KEY (userID) REFERENCES users (id)
)
GO

CREATE TABLE posts (
	id int NOT NULL,
	decription varchar(255)
	PRIMARY KEY (id)
)
GO

CREATE TABLE advertise (
	id int NOT NULL,
	postsID int

)
GO

-- Tiến hành insert các dữ liệu
insert into brands (id, brandsName) values (1, 'Edgetag');
insert into brands (id, brandsName) values (2, 'Wikibox');
insert into brands (id, brandsName) values (3, 'LiveZ');
insert into brands (id, brandsName) values (4, 'Oyope');
insert into brands (id, brandsName) values (5, 'LiveZ');
insert into brands (id, brandsName) values (6, 'Realpoint');
insert into brands (id, brandsName) values (7, 'Mycat');
insert into brands (id, brandsName) values (8, 'Photobug');
insert into brands (id, brandsName) values (9, 'Twitterlist');
insert into brands (id, brandsName) values (10, 'Blogtags');
insert into brands (id, brandsName) values (11, 'Riffwire');
insert into brands (id, brandsName) values (12, 'Skajo');
insert into brands (id, brandsName) values (13, 'Blognation');
insert into brands (id, brandsName) values (14, 'Meeveo');
insert into brands (id, brandsName) values (15, 'Vinte');
insert into brands (id, brandsName) values (16, 'Skajo');
insert into brands (id, brandsName) values (17, 'Blogspan');
insert into brands (id, brandsName) values (18, 'Flashpoint');
insert into brands (id, brandsName) values (19, 'Feedfish');
insert into brands (id, brandsName) values (20, 'Aibox');
insert into brands (id, brandsName) values (21, 'Jaloo');
insert into brands (id, brandsName) values (22, 'Kamba');
insert into brands (id, brandsName) values (23, 'Browsebug');
insert into brands (id, brandsName) values (24, 'Livetube');
insert into brands (id, brandsName) values (25, 'Browsecat');
insert into brands (id, brandsName) values (26, 'Tekfly');
insert into brands (id, brandsName) values (27, 'Babbleblab');
insert into brands (id, brandsName) values (28, 'Devpulse');
insert into brands (id, brandsName) values (29, 'Youopia');
insert into brands (id, brandsName) values (30, 'Yamia');
insert into brands (id, brandsName) values (31, 'Reallinks');
insert into brands (id, brandsName) values (32, 'Pixope');
insert into brands (id, brandsName) values (33, 'Layo');
insert into brands (id, brandsName) values (34, 'Blogpad');
insert into brands (id, brandsName) values (35, 'Blogpad');
insert into brands (id, brandsName) values (36, 'Tekfly');
insert into brands (id, brandsName) values (37, 'Edgeblab');
insert into brands (id, brandsName) values (38, 'Viva');
insert into brands (id, brandsName) values (39, 'Eabox');
insert into brands (id, brandsName) values (40, 'Zoovu');
insert into brands (id, brandsName) values (41, 'Gigazoom');
insert into brands (id, brandsName) values (42, 'Latz');
insert into brands (id, brandsName) values (43, 'Blognation');
insert into brands (id, brandsName) values (44, 'Quinu');
insert into brands (id, brandsName) values (45, 'Eare');
insert into brands (id, brandsName) values (46, 'Eazzy');
insert into brands (id, brandsName) values (47, 'Feedmix');
insert into brands (id, brandsName) values (48, 'Fivebridge');
insert into brands (id, brandsName) values (49, 'Tavu');
insert into brands (id, brandsName) values (50, 'Jabberstorm');
insert into brands (id, brandsName) values (51, 'Voomm');
insert into brands (id, brandsName) values (52, 'Wordify');
insert into brands (id, brandsName) values (53, 'Wordpedia');
insert into brands (id, brandsName) values (54, 'Browsebug');
insert into brands (id, brandsName) values (55, 'Livepath');
insert into brands (id, brandsName) values (56, 'Topdrive');
insert into brands (id, brandsName) values (57, 'Oyoloo');
insert into brands (id, brandsName) values (58, 'Bluejam');
insert into brands (id, brandsName) values (59, 'Thoughtbeat');
insert into brands (id, brandsName) values (60, 'Kare');
insert into brands (id, brandsName) values (61, 'Centidel');
insert into brands (id, brandsName) values (62, 'Centidel');
insert into brands (id, brandsName) values (63, 'Buzzbean');
insert into brands (id, brandsName) values (64, 'Jazzy');
insert into brands (id, brandsName) values (65, 'Gabvine');
insert into brands (id, brandsName) values (66, 'Ainyx');
insert into brands (id, brandsName) values (67, 'Shuffletag');
insert into brands (id, brandsName) values (68, 'Buzzbean');
insert into brands (id, brandsName) values (69, 'Devpoint');
insert into brands (id, brandsName) values (70, 'Skyble');
insert into brands (id, brandsName) values (71, 'Brainlounge');
insert into brands (id, brandsName) values (72, 'Buzzdog');
insert into brands (id, brandsName) values (73, 'Edgeify');
insert into brands (id, brandsName) values (74, 'Dynabox');
insert into brands (id, brandsName) values (75, 'Thoughtbeat');
insert into brands (id, brandsName) values (76, 'Jamia');
insert into brands (id, brandsName) values (77, 'Eayo');
insert into brands (id, brandsName) values (78, 'Tagpad');
insert into brands (id, brandsName) values (79, 'Voonyx');
insert into brands (id, brandsName) values (80, 'Dynazzy');
insert into brands (id, brandsName) values (81, 'Flashpoint');
insert into brands (id, brandsName) values (82, 'Gigashots');
insert into brands (id, brandsName) values (83, 'Avamba');
insert into brands (id, brandsName) values (84, 'Tagcat');
insert into brands (id, brandsName) values (85, 'Bluejam');
insert into brands (id, brandsName) values (86, 'Voomm');
insert into brands (id, brandsName) values (87, 'Myworks');
insert into brands (id, brandsName) values (88, 'Oodoo');
insert into brands (id, brandsName) values (89, 'Centimia');
insert into brands (id, brandsName) values (90, 'Yakitri');
insert into brands (id, brandsName) values (91, 'Lajo');
insert into brands (id, brandsName) values (92, 'Vitz');
insert into brands (id, brandsName) values (93, 'JumpXS');
insert into brands (id, brandsName) values (94, 'Topicware');
insert into brands (id, brandsName) values (95, 'Skibox');
insert into brands (id, brandsName) values (96, 'Lazz');
insert into brands (id, brandsName) values (97, 'Oyoloo');
insert into brands (id, brandsName) values (98, 'Latz');
insert into brands (id, brandsName) values (99, 'Pixope');
insert into brands (id, brandsName) values (100, 'Ozu');
GO

INSERT INTO genders VALUES 
	('1', 'Nam'), 
	('2', 'Nữ'), 
	('3', 'Khác')
GO

insert into categories (id, categoriesName) values (1, 'Cloned fresh-thinking architecture');
insert into categories (id, categoriesName) values (2, 'Vision-oriented 24/7 archive');
insert into categories (id, categoriesName) values (3, 'Horizontal solution-oriented emulation');
insert into categories (id, categoriesName) values (4, 'Streamlined value-added local area network');
insert into categories (id, categoriesName) values (5, 'Digitized analyzing internet solution');
insert into categories (id, categoriesName) values (6, 'Front-line zero administration structure');
insert into categories (id, categoriesName) values (7, 'Compatible analyzing contingency');
insert into categories (id, categoriesName) values (8, 'Profound static middleware');
insert into categories (id, categoriesName) values (9, 'Inverse client-server success');
insert into categories (id, categoriesName) values (10, 'Horizontal maximized benchmark');
insert into categories (id, categoriesName) values (11, 'Multi-tiered mission-critical capacity');
insert into categories (id, categoriesName) values (12, 'Operative leading edge synergy');
insert into categories (id, categoriesName) values (13, 'Virtual zero defect migration');
insert into categories (id, categoriesName) values (14, 'Programmable bifurcated core');
insert into categories (id, categoriesName) values (15, 'Balanced dynamic neural-net');
insert into categories (id, categoriesName) values (16, 'Operative user-facing extranet');
insert into categories (id, categoriesName) values (17, 'Future-proofed contextually-based product');
insert into categories (id, categoriesName) values (18, 'De-engineered 3rd generation implementation');
insert into categories (id, categoriesName) values (19, 'Upgradable content-based solution');
insert into categories (id, categoriesName) values (20, 'Monitored full-range success');
insert into categories (id, categoriesName) values (21, 'Multi-channelled maximized groupware');
insert into categories (id, categoriesName) values (22, 'Distributed fresh-thinking definition');
insert into categories (id, categoriesName) values (23, 'Vision-oriented actuating flexibility');
insert into categories (id, categoriesName) values (24, 'Secured attitude-oriented customer loyalty');
insert into categories (id, categoriesName) values (25, 'Team-oriented motivating firmware');
insert into categories (id, categoriesName) values (26, 'Advanced object-oriented collaboration');
insert into categories (id, categoriesName) values (27, 'Profit-focused actuating open system');
insert into categories (id, categoriesName) values (28, 'Customizable directional access');
insert into categories (id, categoriesName) values (29, 'Extended 3rd generation policy');
insert into categories (id, categoriesName) values (30, 'Visionary empowering extranet');
insert into categories (id, categoriesName) values (31, 'Focused responsive middleware');
insert into categories (id, categoriesName) values (32, 'Seamless bifurcated product');
insert into categories (id, categoriesName) values (33, 'Team-oriented eco-centric standardization');
insert into categories (id, categoriesName) values (34, 'Compatible object-oriented interface');
insert into categories (id, categoriesName) values (35, 'Face to face global Graphic Interface');
insert into categories (id, categoriesName) values (36, 'Inverse empowering ability');
insert into categories (id, categoriesName) values (37, 'Re-contextualized system-worthy workforce');
insert into categories (id, categoriesName) values (38, 'Focused maximized leverage');
insert into categories (id, categoriesName) values (39, 'Re-engineered secondary contingency');
insert into categories (id, categoriesName) values (40, 'Vision-oriented 6th generation structure');
insert into categories (id, categoriesName) values (41, 'Horizontal executive artificial intelligence');
insert into categories (id, categoriesName) values (42, 'Total upward-trending matrix');
insert into categories (id, categoriesName) values (43, 'Integrated solution-oriented focus group');
insert into categories (id, categoriesName) values (44, 'Fully-configurable bottom-line challenge');
insert into categories (id, categoriesName) values (45, 'Re-engineered homogeneous extranet');
insert into categories (id, categoriesName) values (46, 'Cloned hybrid application');
insert into categories (id, categoriesName) values (47, 'Open-architected full-range process improvement');
insert into categories (id, categoriesName) values (48, 'Mandatory national strategy');
insert into categories (id, categoriesName) values (49, 'Balanced client-driven productivity');
insert into categories (id, categoriesName) values (50, 'Virtual full-range concept');
insert into categories (id, categoriesName) values (51, 'Automated explicit hardware');
insert into categories (id, categoriesName) values (52, 'Expanded analyzing open architecture');
insert into categories (id, categoriesName) values (53, 'Persevering analyzing ability');
insert into categories (id, categoriesName) values (54, 'Multi-lateral solution-oriented ability');
insert into categories (id, categoriesName) values (55, 'Progressive mission-critical open system');
insert into categories (id, categoriesName) values (56, 'Open-source zero defect solution');
insert into categories (id, categoriesName) values (57, 'Profit-focused uniform portal');
insert into categories (id, categoriesName) values (58, 'Seamless hybrid leverage');
insert into categories (id, categoriesName) values (59, 'Self-enabling maximized matrices');
insert into categories (id, categoriesName) values (60, 'Future-proofed cohesive toolset');
insert into categories (id, categoriesName) values (61, 'Programmable cohesive groupware');
insert into categories (id, categoriesName) values (62, 'Function-based actuating ability');
insert into categories (id, categoriesName) values (63, 'Triple-buffered tertiary hardware');
insert into categories (id, categoriesName) values (64, 'Right-sized bottom-line knowledge base');
insert into categories (id, categoriesName) values (65, 'Diverse neutral interface');
insert into categories (id, categoriesName) values (66, 'Programmable regional moratorium');
insert into categories (id, categoriesName) values (67, 'Mandatory client-server help-desk');
insert into categories (id, categoriesName) values (68, 'Visionary 24/7 function');
insert into categories (id, categoriesName) values (69, 'Virtual global utilisation');
insert into categories (id, categoriesName) values (70, 'Open-source intermediate architecture');
insert into categories (id, categoriesName) values (71, 'Innovative intangible monitoring');
insert into categories (id, categoriesName) values (72, 'Reduced next generation process improvement');
insert into categories (id, categoriesName) values (73, 'Distributed 3rd generation initiative');
insert into categories (id, categoriesName) values (74, 'Persistent interactive system engine');
insert into categories (id, categoriesName) values (75, 'Optional mobile functionalities');
insert into categories (id, categoriesName) values (76, 'Front-line dynamic data-warehouse');
insert into categories (id, categoriesName) values (77, 'Versatile heuristic service-desk');
insert into categories (id, categoriesName) values (78, 'Cross-platform impactful open architecture');
insert into categories (id, categoriesName) values (79, 'Visionary zero tolerance analyzer');
insert into categories (id, categoriesName) values (80, 'Down-sized exuding pricing structure');
insert into categories (id, categoriesName) values (81, 'De-engineered even-keeled knowledge base');
insert into categories (id, categoriesName) values (82, 'Optimized fault-tolerant data-warehouse');
insert into categories (id, categoriesName) values (83, 'Ameliorated regional concept');
insert into categories (id, categoriesName) values (84, 'Synergized explicit parallelism');
insert into categories (id, categoriesName) values (85, 'Enhanced web-enabled paradigm');
insert into categories (id, categoriesName) values (86, 'Decentralized actuating intranet');
insert into categories (id, categoriesName) values (87, 'Progressive mobile frame');
insert into categories (id, categoriesName) values (88, 'Compatible value-added capability');
insert into categories (id, categoriesName) values (89, 'Profound context-sensitive website');
insert into categories (id, categoriesName) values (90, 'Right-sized regional system engine');
insert into categories (id, categoriesName) values (91, 'Cloned fault-tolerant paradigm');
insert into categories (id, categoriesName) values (92, 'Compatible holistic structure');
insert into categories (id, categoriesName) values (93, 'Customizable bifurcated methodology');
insert into categories (id, categoriesName) values (94, 'Streamlined zero tolerance framework');
insert into categories (id, categoriesName) values (95, 'Multi-tiered solution-oriented conglomeration');
insert into categories (id, categoriesName) values (96, 'Exclusive systemic portal');
insert into categories (id, categoriesName) values (97, 'User-centric exuding solution');
insert into categories (id, categoriesName) values (98, 'Multi-lateral zero defect capability');
insert into categories (id, categoriesName) values (99, 'Polarised heuristic analyzer');
insert into categories (id, categoriesName) values (100, 'Pre-emptive interactive framework');
GO

INSERT INTO order_status VALUES 
	('1', 'Thành công'), 
	('2', 'Không thành công'),
	('3', 'Đang giao hàng'), 
	('6', 'Trả hàng'), 
	('4', 'Bị hủy'), 
	('5', 'Lỗi đơn hàng')
GO

INSERT INTO product_status VALUES
	('1', 'Đặc biệt'),
	('2', 'Bán chạy'),
	('3', 'Thông thường'),
	('4', 'Hết hàng'),
	('5', 'Bị ẩn')
GO

INSERT INTO role_user VALUES 
	('1', 'Siêu quản trị'),
	('1', 'Quản trị'),
	('2', 'Dịch vụ'),
	('3', 'Người dùng'),
	('4', 'Khách')
GO

INSERT INTO voucher_scope VALUES
	('1', 'Sản phẩm'),
	('2', 'Loại'),
	('3', 'Thương hiệu')
GO

INSERT INTO voucher_status VALUES 
	('2', 'Đặc biệt'),
	('2', 'Hoạt động'),
	('3', 'Hết thời hạn'),
	('4', 'Bị ẩn')
GO

INSERT INTO voucher_type VALUES 
	('1', 'Cá nhân'),
	('2', 'Không xác định')
GO

insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (1, 'sofa', 49, 'Coffee Table', 87, 3456293, 555486, '2023-09-05', 1165, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (2, 'table', 82, 'Dining Table', 98, 17306746, 361158, '2023-02-21', 1310, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (3, 'sofa', 83, 'Bed', 37, 10047899, 641674, '2023-03-18', 1822, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (4, 'cabinet', 39, 'Cabinet', 59, 10725507, 166367, '2023-03-11', 481, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (5, 'chair', 4, 'Dining Table', 6, 7459932, 564172, '2023-02-22', 351, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (6, 'chair', 21, 'Coffee Table', 72, 17361509, 659699, '2023-06-29', 112, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (7, 'table', 66, 'TV Stand', 37, 11063362, 605648, '2023-08-27', 539, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (8, 'desk', 2, 'TV Stand', 71, 15897553, 193938, '2023-07-15', 1898, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (9, 'table', 92, 'Chair', 14, 19849578, 216817, '2023-09-21', 849, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (10, 'table', 29, 'Chair', 63, 1890402, 112641, '2023-10-12', 992, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (11, 'chair', 84, 'Cabinet', 12, 10581061, 486704, '2023-01-02', 761, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (12, 'cabinet', 69, 'Cabinet', 36, 9577490, 492127, '2023-08-16', 1600, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (13, 'sofa', 33, 'Dining Table', 29, 2951906, 645868, '2023-05-23', 803, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (14, 'desk', 55, 'TV Stand', 66, 10587101, 447030, '2023-02-09', 640, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (15, 'cabinet', 43, 'Dining Table', 65, 18143320, 282549, '2023-02-11', 905, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (16, 'chair', 77, 'Wardrobe', 21, 15968140, 633662, '2023-09-14', 130, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (17, 'chair', 27, 'Cabinet', 53, 6114908, 226084, '2023-06-28', 1642, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (18, 'desk', 27, 'Desk', 65, 15390311, 156807, '2023-02-27', 833, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (19, 'cabinet', 74, 'Chair', 2, 16391533, 718388, '2023-08-25', 1629, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (20, 'chair', 90, 'Sofa', 36, 18322503, 238142, '2023-10-30', 969, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (21, 'chair', 27, 'TV Stand', 55, 18368505, 426963, '2023-07-20', 1818, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (22, 'desk', 43, 'Bed', 9, 16661538, 338161, '2023-04-01', 953, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (23, 'chair', 92, 'Desk', 39, 5397136, 478738, '2023-08-27', 890, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (24, 'sofa', 28, 'Desk', 40, 12514607, 492947, '2023-11-23', 1657, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (25, 'table', 63, 'Wardrobe', 14, 6725354, 778650, '2023-03-26', 1592, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (26, 'chair', 68, 'Chair', 55, 15950214, 594893, '2023-07-19', 245, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (27, 'sofa', 97, 'Dining Table', 77, 13068483, 661086, '2023-07-08', 300, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (28, 'table', 76, 'Coffee Table', 17, 9893783, 425664, '2022-12-08', 1091, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (29, 'desk', 85, 'Wardrobe', 64, 8592298, 725360, '2023-09-05', 274, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (30, 'cabinet', 100, 'TV Stand', 63, 5224435, 624537, '2023-10-14', 1271, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (31, 'chair', 95, 'Chair', 30, 15808537, 750918, '2023-06-23', 253, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (32, 'desk', 7, 'Desk', 95, 17673805, 474677, '2023-07-04', 989, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (33, 'table', 31, 'Desk', 65, 14591385, 555647, '2023-10-16', 229, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (34, 'desk', 31, 'Bookshelf', 54, 6216545, 475127, '2023-10-14', 1462, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (35, 'table', 89, 'Bookshelf', 5, 15994295, 412068, '2022-11-28', 1804, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (36, 'sofa', 24, 'Bed', 20, 7820299, 625409, '2023-03-02', 558, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (37, 'desk', 16, 'Chair', 65, 13273792, 428574, '2022-12-07', 1217, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (38, 'cabinet', 10, 'Coffee Table', 61, 16307289, 170431, '2022-12-31', 1825, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (39, 'sofa', 71, 'Bed', 82, 12201332, 175006, '2023-01-10', 616, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (40, 'table', 25, 'Desk', 9, 1910542, 164178, '2023-08-05', 1783, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (41, 'desk', 100, 'Coffee Table', 73, 11803480, 427978, '2023-07-20', 1908, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (42, 'table', 62, 'Chair', 64, 18793067, 162597, '2023-03-15', 1350, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (43, 'sofa', 50, 'Sofa', 18, 13878842, 117820, '2023-02-09', 1492, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (44, 'chair', 82, 'Dining Table', 41, 3738585, 771830, '2023-09-04', 35, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (45, 'cabinet', 35, 'Wardrobe', 79, 13584243, 610110, '2023-02-27', 1854, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (46, 'sofa', 16, 'Bookshelf', 87, 8975101, 300551, '2023-05-12', 1551, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (47, 'cabinet', 97, 'Dining Table', 73, 4934501, 765053, '2023-05-21', 48, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (48, 'cabinet', 38, 'Bed', 20, 12746387, 134736, '2023-08-26', 1733, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (49, 'chair', 58, 'Desk', 8, 3124883, 677842, '2023-03-23', 691, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (50, 'sofa', 65, 'Coffee Table', 74, 3993082, 750947, '2023-05-31', 592, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (51, 'table', 42, 'Chair', 53, 16332764, 812706, '2023-04-06', 954, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (52, 'sofa', 52, 'Sofa', 69, 8786281, 243519, '2023-05-14', 1523, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (53, 'sofa', 22, 'Chair', 68, 8935561, 770044, '2023-04-10', 299, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (54, 'table', 96, 'Sofa', 44, 5886774, 200105, '2022-12-17', 233, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (55, 'desk', 33, 'Bed', 27, 16672004, 832361, '2023-10-29', 411, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (56, 'table', 22, 'TV Stand', 66, 7261251, 459356, '2023-05-11', 620, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (57, 'desk', 9, 'Wardrobe', 99, 11900598, 172035, '2023-11-27', 9, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (58, 'sofa', 32, 'Bookshelf', 2, 18404306, 410547, '2023-03-03', 1347, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (59, 'table', 4, 'Bed', 11, 13572953, 456078, '2023-03-27', 60, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (60, 'cabinet', 20, 'Desk', 62, 14768605, 174473, '2023-03-08', 599, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (61, 'sofa', 68, 'Bed', 2, 14323446, 534006, '2023-08-20', 68, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (62, 'table', 9, 'Desk', 42, 11499915, 403799, '2023-02-12', 1532, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (63, 'table', 29, 'Coffee Table', 83, 18129297, 524005, '2023-03-16', 1924, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (64, 'table', 73, 'Sofa', 92, 5104673, 116847, '2023-11-21', 1788, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (65, 'chair', 79, 'Desk', 37, 9015887, 160812, '2023-06-10', 1323, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (66, 'sofa', 95, 'Desk', 7, 10160883, 353012, '2023-05-24', 1020, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (67, 'sofa', 30, 'Sofa', 98, 8849411, 765713, '2023-07-31', 1438, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (68, 'table', 75, 'Sofa', 85, 13613436, 894704, '2023-01-20', 1062, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (69, 'desk', 24, 'Bed', 66, 3555641, 353680, '2023-03-09', 1534, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (70, 'chair', 33, 'Chair', 74, 9370325, 749805, '2023-09-28', 1032, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (71, 'sofa', 21, 'Cabinet', 28, 8427695, 572796, '2023-02-10', 859, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (72, 'sofa', 30, 'Chair', 45, 18049181, 411230, '2023-07-02', 885, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (73, 'sofa', 4, 'Chair', 68, 9556280, 165359, '2022-12-14', 1227, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (74, 'chair', 19, 'Desk', 9, 15121910, 524314, '2023-11-25', 442, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (75, 'desk', 25, 'Bed', 23, 7947066, 598334, '2023-01-20', 101, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (76, 'table', 100, 'Sofa', 85, 17735452, 283182, '2022-12-26', 1802, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (77, 'table', 64, 'Dining Table', 60, 16655168, 887768, '2023-09-17', 816, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (78, 'sofa', 67, 'Coffee Table', 12, 6912514, 635599, '2023-08-10', 374, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (79, 'sofa', 18, 'Cabinet', 74, 1817788, 117598, '2023-07-26', 1985, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (80, 'sofa', 83, 'Bookshelf', 6, 12236969, 664583, '2023-04-26', 1343, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (81, 'cabinet', 54, 'Sofa', 4, 4398160, 528241, '2023-07-23', 1532, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (82, 'cabinet', 37, 'Cabinet', 54, 12453195, 572097, '2022-12-27', 1986, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (83, 'desk', 27, 'Bed', 93, 15867934, 864612, '2022-12-20', 250, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (84, 'chair', 4, 'Desk', 70, 18000608, 315488, '2023-10-18', 811, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (85, 'table', 28, 'Chair', 79, 19371555, 271990, '2023-05-16', 591, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (86, 'chair', 51, 'Bed', 7, 5166611, 184545, '2023-07-02', 845, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (87, 'desk', 42, 'Dining Table', 24, 8641471, 403839, '2023-08-31', 425, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (88, 'cabinet', 65, 'Bookshelf', 23, 4286585, 511199, '2023-07-10', 1139, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (89, 'cabinet', 91, 'Desk', 82, 11689850, 813547, '2023-06-17', 1821, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (90, 'chair', 33, 'Dining Table', 15, 18965072, 548737, '2023-08-08', 1930, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (91, 'desk', 87, 'Bookshelf', 70, 10482607, 119913, '2023-06-18', 857, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (92, 'cabinet', 44, 'Wardrobe', 24, 11143850, 740317, '2023-06-02', 1553, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (93, 'cabinet', 57, 'TV Stand', 100, 1003762, 118551, '2023-03-20', 1853, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (94, 'desk', 20, 'TV Stand', 82, 1131654, 756586, '2023-11-22', 31, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (95, 'table', 76, 'Desk', 12, 9430813, 538894, '2022-12-20', 1688, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (96, 'cabinet', 85, 'Desk', 23, 15140143, 561066, '2023-01-28', 1237, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (97, 'desk', 96, 'TV Stand', 3, 4177985, 395899, '2023-11-15', 1242, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (98, 'desk', 6, 'Sofa', 29, 10540097, 834253, '2023-09-30', 49, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (99, 'cabinet', 70, 'Sofa', 32, 12576239, 877430, '2023-04-30', 1178, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (100, 'chair', 85, 'Chair', 13, 11861224, 841323, '2023-03-15', 1946, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (101, 'table', 12, 'Bed', 89, 2628869, 877381, '2022-12-29', 1327, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (102, 'chair', 21, 'Dining Table', 13, 19647973, 649349, '2023-04-01', 1009, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (103, 'sofa', 79, 'Cabinet', 52, 19231109, 453660, '2023-01-18', 1127, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (104, 'chair', 79, 'Dining Table', 17, 11231291, 672226, '2023-01-13', 137, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (105, 'desk', 96, 'Chair', 15, 10995901, 196491, '2023-03-03', 319, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (106, 'desk', 36, 'TV Stand', 56, 12336133, 768039, '2023-06-17', 369, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (107, 'sofa', 56, 'Desk', 90, 13107388, 395463, '2023-09-09', 1505, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (108, 'desk', 20, 'Bookshelf', 41, 7348537, 533981, '2023-08-27', 1893, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (109, 'cabinet', 80, 'Bed', 83, 8497410, 159379, '2022-12-17', 1067, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (110, 'chair', 13, 'Chair', 78, 18252981, 238254, '2023-08-28', 1040, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (111, 'desk', 49, 'Cabinet', 82, 14668797, 445961, '2023-10-01', 1111, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (112, 'desk', 20, 'Sofa', 71, 7036744, 442299, '2023-05-13', 1389, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (113, 'chair', 86, 'Bed', 81, 18310821, 469515, '2023-02-19', 1412, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (114, 'sofa', 90, 'Cabinet', 79, 2851616, 267183, '2023-05-21', 530, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (115, 'chair', 38, 'Dining Table', 3, 10606571, 660882, '2023-09-09', 159, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (116, 'table', 100, 'Wardrobe', 40, 4362497, 800339, '2023-05-08', 1801, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (117, 'cabinet', 74, 'Chair', 57, 15268786, 370561, '2023-01-04', 1000, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (118, 'desk', 89, 'Wardrobe', 74, 3131428, 691767, '2022-12-25', 683, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (119, 'desk', 75, 'Coffee Table', 100, 8454719, 304993, '2023-10-21', 1225, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (120, 'cabinet', 63, 'Sofa', 20, 15286858, 593842, '2023-01-19', 539, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (121, 'table', 43, 'Bookshelf', 31, 16443991, 542405, '2023-03-14', 1233, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (122, 'desk', 54, 'Coffee Table', 25, 17814624, 378572, '2023-02-18', 452, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (123, 'desk', 6, 'Bed', 5, 12699680, 478070, '2022-12-19', 52, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (124, 'sofa', 61, 'Dining Table', 32, 9411045, 583638, '2023-06-01', 161, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (125, 'sofa', 58, 'Bed', 17, 5694378, 321979, '2023-05-12', 1817, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (126, 'table', 58, 'Dining Table', 4, 19991009, 833641, '2023-01-16', 143, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (127, 'sofa', 31, 'Sofa', 34, 14818787, 774748, '2023-07-22', 1710, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (128, 'sofa', 71, 'Bed', 82, 13685860, 866543, '2023-03-29', 685, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (129, 'sofa', 51, 'Dining Table', 45, 12037299, 274906, '2023-01-25', 1530, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (130, 'chair', 56, 'Cabinet', 91, 9374247, 181673, '2023-11-17', 1421, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (131, 'sofa', 40, 'Desk', 48, 1411594, 178835, '2023-03-06', 961, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (132, 'table', 84, 'Desk', 44, 11107925, 663290, '2023-03-29', 411, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (133, 'chair', 78, 'Coffee Table', 11, 17147097, 526340, '2022-12-14', 487, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (134, 'sofa', 13, 'TV Stand', 6, 5183820, 849383, '2023-01-03', 1173, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (135, 'sofa', 16, 'Coffee Table', 51, 15758824, 139226, '2023-09-10', 1090, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (136, 'chair', 73, 'Wardrobe', 19, 15521245, 358911, '2023-06-02', 1334, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (137, 'desk', 21, 'Cabinet', 28, 4628312, 272315, '2023-08-19', 552, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (138, 'chair', 27, 'Cabinet', 23, 16390181, 405297, '2023-07-27', 1311, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (139, 'chair', 75, 'Dining Table', 27, 16390301, 455511, '2023-09-13', 102, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (140, 'chair', 49, 'Chair', 61, 10355219, 667596, '2023-07-09', 254, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (141, 'chair', 14, 'TV Stand', 67, 7740833, 506038, '2023-09-14', 287, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (142, 'table', 38, 'Dining Table', 69, 8979168, 318029, '2023-05-30', 1973, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (143, 'chair', 95, 'TV Stand', 55, 16296530, 407796, '2022-12-26', 224, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (144, 'sofa', 76, 'Dining Table', 62, 12777160, 155345, '2023-07-02', 467, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (145, 'sofa', 27, 'Bed', 91, 15671692, 230836, '2023-03-28', 167, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (146, 'desk', 60, 'Bed', 60, 19688020, 505123, '2023-10-05', 421, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (147, 'table', 10, 'Sofa', 58, 13714124, 234111, '2023-09-24', 1620, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (148, 'cabinet', 52, 'Bed', 66, 13966445, 185556, '2023-10-27', 547, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (149, 'chair', 73, 'Cabinet', 82, 7711551, 883004, '2023-11-09', 171, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (150, 'chair', 48, 'Coffee Table', 95, 8628640, 621950, '2023-09-05', 57, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (151, 'desk', 97, 'TV Stand', 38, 10181065, 843429, '2023-01-02', 420, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (152, 'desk', 21, 'Desk', 67, 19976577, 705743, '2023-07-16', 740, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (153, 'sofa', 4, 'TV Stand', 96, 18737837, 160570, '2023-06-28', 1481, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (154, 'sofa', 6, 'Sofa', 35, 9945726, 107735, '2023-10-01', 910, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (155, 'cabinet', 51, 'Bed', 68, 3034534, 164911, '2023-02-22', 1091, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (156, 'table', 92, 'TV Stand', 65, 13507466, 703711, '2023-11-14', 64, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (157, 'table', 73, 'Chair', 67, 19605259, 113854, '2023-08-24', 1898, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (158, 'cabinet', 40, 'TV Stand', 46, 12950201, 554023, '2022-12-22', 1145, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (159, 'sofa', 5, 'Coffee Table', 42, 15103658, 674457, '2023-06-25', 594, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (160, 'sofa', 69, 'Bed', 60, 3116631, 512701, '2023-03-26', 1520, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (161, 'sofa', 49, 'Dining Table', 12, 16620278, 657400, '2023-06-12', 172, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (162, 'cabinet', 62, 'Bed', 31, 5318081, 617987, '2023-06-06', 1683, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (163, 'cabinet', 91, 'Cabinet', 65, 13733447, 595457, '2023-03-01', 1555, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (164, 'chair', 67, 'Coffee Table', 63, 11262622, 764570, '2022-11-29', 1383, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (165, 'chair', 94, 'Coffee Table', 19, 10923566, 522234, '2023-01-11', 1164, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (166, 'chair', 69, 'Coffee Table', 64, 8906134, 659578, '2023-04-07', 1366, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (167, 'table', 11, 'Cabinet', 54, 3902292, 541446, '2023-10-03', 1679, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (168, 'chair', 76, 'Bookshelf', 10, 8080726, 309224, '2023-07-10', 44, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (169, 'chair', 14, 'Coffee Table', 37, 5638421, 455861, '2022-12-11', 756, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (170, 'sofa', 84, 'Chair', 61, 2623690, 358542, '2023-07-28', 961, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (171, 'cabinet', 10, 'Bed', 78, 3837313, 618978, '2022-12-26', 1528, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (172, 'cabinet', 14, 'Chair', 54, 16946577, 607329, '2023-01-28', 429, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (173, 'sofa', 51, 'Bed', 92, 17608981, 297145, '2023-01-16', 1462, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (174, 'sofa', 7, 'Bookshelf', 44, 14614026, 373824, '2023-09-17', 783, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (175, 'desk', 84, 'Chair', 93, 8288897, 785338, '2023-11-15', 1302, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (176, 'cabinet', 13, 'Chair', 64, 6105505, 829450, '2022-12-06', 562, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (177, 'table', 32, 'Wardrobe', 95, 17451914, 706549, '2023-10-09', 1483, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (178, 'desk', 90, 'Dining Table', 11, 4018582, 472874, '2023-07-29', 1174, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (179, 'chair', 8, 'Wardrobe', 21, 15087458, 622688, '2023-09-18', 871, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (180, 'sofa', 15, 'Desk', 43, 2095536, 599896, '2023-07-12', 1636, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (181, 'chair', 64, 'Desk', 100, 14943907, 348076, '2023-07-15', 1991, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (182, 'desk', 30, 'Dining Table', 39, 8433142, 566800, '2023-11-26', 132, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (183, 'desk', 9, 'Dining Table', 37, 3336509, 864189, '2023-09-03', 1514, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (184, 'sofa', 10, 'Cabinet', 65, 16073005, 506359, '2023-02-06', 1801, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (185, 'table', 75, 'Cabinet', 91, 16959944, 774197, '2023-09-15', 1889, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (186, 'cabinet', 43, 'Bed', 44, 17755421, 245969, '2023-06-10', 1809, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (187, 'chair', 13, 'Cabinet', 23, 13932915, 886568, '2023-03-02', 347, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (188, 'table', 58, 'Bookshelf', 60, 10041276, 508371, '2023-04-14', 1392, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (189, 'cabinet', 79, 'Dining Table', 16, 17564420, 278741, '2023-05-06', 6, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (190, 'cabinet', 73, 'Bookshelf', 48, 10558085, 810928, '2023-08-28', 1882, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (191, 'sofa', 17, 'Coffee Table', 94, 16000130, 280223, '2023-06-19', 652, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (192, 'table', 65, 'TV Stand', 6, 8066885, 727395, '2023-09-12', 481, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (193, 'desk', 59, 'Desk', 89, 11182007, 689305, '2023-06-28', 1938, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (194, 'chair', 49, 'Coffee Table', 82, 16598129, 340515, '2023-04-20', 1137, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (195, 'sofa', 32, 'Coffee Table', 34, 15463242, 642973, '2023-08-28', 600, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (196, 'sofa', 71, 'TV Stand', 25, 3422212, 197305, '2023-10-12', 1686, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (197, 'chair', 93, 'Cabinet', 20, 8682834, 231721, '2023-03-15', 1695, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (198, 'sofa', 14, 'Desk', 66, 17555071, 780527, '2023-03-11', 230, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (199, 'chair', 5, 'Cabinet', 92, 2586336, 559787, '2023-06-27', 274, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (200, 'cabinet', 40, 'Bookshelf', 81, 3530257, 566564, '2023-01-30', 1985, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (201, 'table', 31, 'Chair', 99, 4805051, 117034, '2023-07-18', 1135, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (202, 'table', 93, 'Bookshelf', 30, 3379751, 360720, '2023-03-07', 35, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (203, 'cabinet', 58, 'Desk', 93, 11325697, 643865, '2023-09-30', 1192, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (204, 'sofa', 55, 'Cabinet', 56, 12785993, 851181, '2023-07-31', 1028, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (205, 'cabinet', 93, 'Chair', 67, 10506700, 874716, '2023-07-17', 1606, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (206, 'table', 38, 'Bed', 20, 8128674, 832237, '2023-03-09', 177, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (207, 'chair', 85, 'Coffee Table', 31, 10201881, 776682, '2023-08-25', 956, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (208, 'sofa', 11, 'Bed', 97, 6369253, 838018, '2023-11-21', 1331, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (209, 'desk', 2, 'Coffee Table', 50, 16114479, 430465, '2023-04-29', 1698, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (210, 'chair', 99, 'Bed', 72, 1727002, 548841, '2023-06-01', 145, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (211, 'table', 11, 'Desk', 43, 7421359, 331047, '2023-01-12', 1682, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (212, 'sofa', 86, 'TV Stand', 32, 12936118, 720994, '2023-11-27', 1422, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (213, 'cabinet', 29, 'Bookshelf', 44, 10615574, 221385, '2023-09-27', 1879, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (214, 'chair', 47, 'Desk', 84, 9483817, 450894, '2023-01-27', 1574, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (215, 'desk', 47, 'Desk', 13, 10144014, 755009, '2023-06-02', 818, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (216, 'desk', 74, 'Wardrobe', 9, 17623424, 600811, '2023-10-24', 488, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (217, 'table', 56, 'TV Stand', 66, 3126008, 294087, '2023-09-05', 932, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (218, 'cabinet', 80, 'Coffee Table', 98, 3992474, 734525, '2023-03-19', 503, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (219, 'desk', 15, 'Wardrobe', 23, 19165010, 291493, '2023-01-08', 63, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (220, 'chair', 35, 'Desk', 71, 14107468, 695103, '2023-06-12', 1007, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (221, 'table', 22, 'Dining Table', 25, 5343368, 487507, '2023-02-24', 970, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (222, 'desk', 82, 'TV Stand', 38, 12986615, 230777, '2023-06-10', 835, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (223, 'sofa', 75, 'Chair', 87, 18390317, 222631, '2023-04-17', 463, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (224, 'chair', 57, 'Chair', 36, 8010102, 455081, '2023-03-25', 1248, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (225, 'sofa', 83, 'Dining Table', 69, 17781575, 443737, '2023-08-19', 323, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (226, 'chair', 76, 'Wardrobe', 19, 5068416, 873475, '2023-08-30', 1120, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (227, 'sofa', 71, 'Chair', 13, 1812047, 121219, '2023-08-03', 339, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (228, 'table', 37, 'Bed', 48, 4371139, 748498, '2023-11-11', 1285, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (229, 'sofa', 48, 'Cabinet', 16, 3592296, 309301, '2023-04-28', 1178, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (230, 'table', 2, 'TV Stand', 89, 16814573, 768642, '2023-09-13', 1061, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (231, 'chair', 64, 'Wardrobe', 7, 19615581, 768485, '2022-12-12', 756, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (232, 'desk', 48, 'TV Stand', 80, 2378891, 868051, '2022-12-26', 1598, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (233, 'cabinet', 29, 'Cabinet', 22, 5576008, 212168, '2023-05-06', 539, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (234, 'table', 47, 'Coffee Table', 92, 12714166, 664194, '2023-06-02', 844, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (235, 'table', 99, 'Wardrobe', 26, 19454216, 567448, '2022-11-29', 1809, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (236, 'cabinet', 94, 'Bed', 87, 7200950, 412558, '2023-09-03', 1669, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (237, 'sofa', 99, 'Cabinet', 62, 15686127, 489721, '2023-06-24', 1609, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (238, 'table', 99, 'Wardrobe', 37, 19828001, 624815, '2023-11-24', 1293, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (239, 'sofa', 47, 'Dining Table', 87, 10544559, 294671, '2023-10-06', 1483, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (240, 'table', 75, 'Bookshelf', 66, 13413701, 284240, '2023-10-10', 1674, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (241, 'cabinet', 32, 'Dining Table', 62, 6432904, 152257, '2023-10-16', 84, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (242, 'table', 80, 'Coffee Table', 41, 12891693, 202792, '2022-12-10', 830, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (243, 'chair', 88, 'Wardrobe', 38, 18693147, 600233, '2023-10-07', 1429, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (244, 'desk', 98, 'Coffee Table', 35, 7493849, 205062, '2023-09-21', 1454, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (245, 'sofa', 54, 'Dining Table', 4, 3995968, 892431, '2023-09-28', 112, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (246, 'sofa', 70, 'Bed', 50, 14381064, 537415, '2023-05-21', 824, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (247, 'cabinet', 89, 'Chair', 80, 14159683, 576463, '2023-04-06', 1567, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (248, 'sofa', 4, 'Sofa', 80, 18263390, 433228, '2023-03-16', 1267, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (249, 'sofa', 10, 'Coffee Table', 35, 8845093, 883866, '2023-01-11', 1008, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (250, 'desk', 9, 'Desk', 75, 18824998, 191886, '2023-03-20', 1987, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (251, 'desk', 15, 'Wardrobe', 11, 19044005, 175250, '2022-12-06', 1857, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (252, 'cabinet', 100, 'Chair', 65, 6160248, 880001, '2023-07-13', 289, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (253, 'cabinet', 85, 'Cabinet', 92, 17251124, 764494, '2023-02-12', 784, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (254, 'cabinet', 39, 'Desk', 35, 2821472, 795161, '2023-03-22', 428, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (255, 'sofa', 74, 'Sofa', 87, 13648359, 426136, '2023-09-14', 1889, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (256, 'table', 18, 'Dining Table', 43, 10148026, 108669, '2023-10-10', 189, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (257, 'desk', 53, 'Bed', 52, 5999777, 814747, '2023-10-07', 1133, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (258, 'desk', 72, 'Sofa', 18, 15674351, 258913, '2023-11-23', 1759, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (259, 'desk', 74, 'Bookshelf', 97, 8662696, 525132, '2023-07-18', 330, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (260, 'table', 82, 'Sofa', 5, 16633662, 409156, '2023-09-21', 390, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (261, 'table', 14, 'TV Stand', 83, 18682507, 637357, '2022-12-08', 529, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (262, 'table', 67, 'Dining Table', 59, 9440806, 372447, '2023-04-22', 644, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (263, 'cabinet', 28, 'Chair', 60, 3488727, 575808, '2023-03-07', 426, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (264, 'cabinet', 47, 'Cabinet', 85, 1163225, 866195, '2023-08-13', 355, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (265, 'chair', 67, 'Bookshelf', 22, 9428683, 706982, '2023-10-07', 1056, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (266, 'desk', 30, 'Desk', 8, 3983972, 578607, '2023-08-25', 874, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (267, 'desk', 45, 'TV Stand', 65, 8732681, 473635, '2023-09-28', 93, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (268, 'sofa', 37, 'Bed', 32, 4685469, 762083, '2023-08-11', 808, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (269, 'table', 90, 'Cabinet', 73, 5552220, 207650, '2023-10-05', 513, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (270, 'desk', 78, 'Bookshelf', 80, 5022591, 493312, '2023-11-07', 1213, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (271, 'sofa', 72, 'Cabinet', 95, 10292904, 750487, '2023-08-26', 969, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (272, 'cabinet', 88, 'Bed', 19, 11708399, 323927, '2023-08-19', 1933, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (273, 'desk', 91, 'Chair', 47, 3383827, 113428, '2023-04-27', 1286, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (274, 'sofa', 37, 'Chair', 31, 13659604, 374527, '2022-12-18', 1712, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (275, 'table', 100, 'Coffee Table', 35, 10483070, 159447, '2023-11-09', 54, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (276, 'chair', 38, 'TV Stand', 8, 5358481, 823118, '2023-08-20', 1421, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (277, 'sofa', 8, 'Dining Table', 95, 3170976, 137291, '2023-07-31', 1726, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (278, 'desk', 79, 'Bed', 51, 14344361, 634333, '2023-06-12', 1847, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (279, 'table', 33, 'TV Stand', 31, 14710060, 128062, '2023-09-11', 59, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (280, 'table', 22, 'TV Stand', 39, 10568553, 166272, '2023-03-04', 1684, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (281, 'table', 7, 'Cabinet', 100, 16435355, 799012, '2023-11-02', 1886, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (282, 'chair', 89, 'Dining Table', 90, 11607039, 786794, '2023-11-17', 1488, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (283, 'cabinet', 75, 'Dining Table', 69, 18229757, 454647, '2023-03-19', 1349, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (284, 'chair', 63, 'TV Stand', 28, 18516224, 190021, '2023-09-18', 1213, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (285, 'chair', 63, 'TV Stand', 54, 15597074, 780446, '2023-07-18', 719, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (286, 'sofa', 29, 'Bed', 60, 8784427, 848511, '2023-06-12', 1864, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (287, 'desk', 71, 'Bookshelf', 82, 14785610, 166976, '2022-12-08', 381, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (288, 'cabinet', 74, 'Dining Table', 57, 15859999, 225398, '2023-04-12', 1524, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (289, 'cabinet', 79, 'TV Stand', 77, 14646957, 526865, '2023-05-23', 193, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (290, 'sofa', 38, 'Bookshelf', 99, 11354580, 200921, '2023-10-27', 1118, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (291, 'cabinet', 86, 'Chair', 83, 11094364, 577457, '2022-12-06', 843, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (292, 'chair', 65, 'Sofa', 83, 9442614, 851102, '2023-01-30', 1967, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (293, 'chair', 57, 'Coffee Table', 65, 10798120, 442462, '2023-02-08', 425, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (294, 'cabinet', 54, 'Chair', 6, 13063238, 216835, '2023-03-07', 112, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (295, 'cabinet', 61, 'Sofa', 55, 17401899, 732096, '2023-06-23', 1493, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (296, 'cabinet', 48, 'TV Stand', 70, 7592939, 428895, '2023-09-19', 607, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (297, 'table', 13, 'Dining Table', 85, 11182030, 869915, '2023-05-02', 1844, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (298, 'table', 8, 'Sofa', 56, 13825582, 428787, '2022-12-30', 897, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (299, 'sofa', 35, 'Wardrobe', 10, 15466074, 810470, '2023-02-09', 956, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (300, 'chair', 79, 'Wardrobe', 84, 12251606, 301701, '2023-01-28', 605, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (301, 'desk', 88, 'Chair', 45, 3493509, 108891, '2023-09-11', 678, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (302, 'chair', 90, 'Bed', 49, 5725240, 519185, '2023-04-04', 763, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (303, 'chair', 26, 'Coffee Table', 52, 4246696, 697297, '2022-12-10', 1354, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (304, 'desk', 61, 'Wardrobe', 97, 2147081, 618865, '2023-01-03', 1280, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (305, 'cabinet', 67, 'Sofa', 1, 12213238, 445133, '2023-02-22', 36, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (306, 'sofa', 57, 'Cabinet', 98, 7769838, 239301, '2023-04-04', 77, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (307, 'cabinet', 20, 'Bookshelf', 60, 19991787, 764439, '2023-04-06', 1719, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (308, 'chair', 9, 'Desk', 31, 16221701, 543074, '2023-10-31', 950, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (309, 'desk', 4, 'TV Stand', 40, 1022602, 787729, '2022-12-12', 1126, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (310, 'desk', 92, 'Wardrobe', 54, 15874121, 577490, '2023-07-12', 1955, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (311, 'cabinet', 70, 'Wardrobe', 86, 14202789, 504857, '2023-11-04', 579, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (312, 'sofa', 63, 'Desk', 57, 8374885, 725514, '2023-05-13', 214, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (313, 'desk', 57, 'Chair', 100, 5974055, 836488, '2023-08-04', 1141, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (314, 'table', 13, 'Wardrobe', 100, 11719164, 738789, '2023-11-06', 1746, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (315, 'chair', 23, 'Dining Table', 19, 7400835, 268070, '2023-08-20', 389, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (316, 'desk', 18, 'Sofa', 60, 10509151, 830407, '2023-06-27', 516, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (317, 'table', 29, 'Coffee Table', 81, 16591522, 829805, '2023-08-07', 731, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (318, 'desk', 2, 'Wardrobe', 84, 17121892, 773119, '2022-12-25', 975, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (319, 'desk', 50, 'Dining Table', 24, 2850520, 221441, '2023-07-20', 1884, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (320, 'desk', 6, 'Wardrobe', 28, 7459563, 337610, '2022-12-19', 1120, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (321, 'cabinet', 5, 'Desk', 25, 10436518, 730042, '2022-11-28', 550, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (322, 'chair', 70, 'Bookshelf', 54, 15743187, 178064, '2022-12-07', 18, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (323, 'cabinet', 46, 'Chair', 39, 3216929, 501827, '2023-11-22', 1035, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (324, 'desk', 46, 'Bed', 64, 14806885, 890320, '2023-03-01', 1453, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (325, 'cabinet', 3, 'Bookshelf', 100, 11009594, 388307, '2023-10-06', 1621, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (326, 'desk', 24, 'Cabinet', 54, 13039248, 213432, '2023-02-20', 545, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (327, 'cabinet', 7, 'Bed', 63, 14422084, 374584, '2023-11-27', 175, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (328, 'desk', 39, 'Dining Table', 53, 16746176, 419301, '2023-02-03', 967, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (329, 'sofa', 30, 'TV Stand', 66, 17324443, 369954, '2023-10-11', 1098, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (330, 'desk', 46, 'TV Stand', 66, 9139722, 282543, '2023-10-11', 1117, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (331, 'table', 5, 'Bed', 63, 10039568, 242471, '2023-10-04', 1692, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (332, 'chair', 60, 'Cabinet', 89, 14464523, 153277, '2023-01-12', 1481, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (333, 'desk', 85, 'TV Stand', 85, 2521232, 788402, '2023-10-07', 403, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (334, 'chair', 76, 'Coffee Table', 88, 7625660, 191296, '2023-03-25', 399, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (335, 'chair', 44, 'Coffee Table', 55, 3540278, 105964, '2023-11-15', 1981, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (336, 'table', 94, 'Cabinet', 63, 6273568, 680892, '2023-05-01', 1363, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (337, 'sofa', 27, 'Desk', 7, 17150881, 276189, '2023-05-22', 922, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (338, 'sofa', 13, 'Coffee Table', 16, 7603743, 335793, '2022-12-08', 275, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (339, 'cabinet', 44, 'Dining Table', 46, 19162930, 347759, '2023-03-23', 117, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (340, 'cabinet', 30, 'Dining Table', 69, 11674176, 600327, '2022-12-12', 1617, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (341, 'desk', 24, 'TV Stand', 69, 11589975, 569010, '2023-07-07', 179, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (342, 'table', 20, 'Bed', 1, 15747654, 398042, '2023-03-24', 993, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (343, 'cabinet', 87, 'Bookshelf', 8, 7902751, 290655, '2023-08-01', 843, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (344, 'table', 80, 'TV Stand', 58, 12305338, 458868, '2022-12-29', 742, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (345, 'cabinet', 22, 'Sofa', 46, 9362828, 125570, '2023-10-12', 889, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (346, 'chair', 15, 'Dining Table', 20, 12236906, 764130, '2023-09-09', 1678, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (347, 'desk', 63, 'Bookshelf', 4, 8490312, 831535, '2023-07-02', 312, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (348, 'desk', 97, 'Desk', 96, 2431626, 686585, '2022-12-07', 676, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (349, 'chair', 52, 'Chair', 68, 1688803, 241537, '2023-01-05', 384, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (350, 'chair', 90, 'Desk', 100, 15931783, 845664, '2023-04-14', 779, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (351, 'table', 60, 'Bed', 27, 2451595, 458051, '2023-03-16', 1642, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (352, 'table', 97, 'Dining Table', 81, 16525744, 191077, '2023-07-02', 1423, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (353, 'desk', 19, 'Wardrobe', 99, 19654073, 336671, '2023-09-19', 1263, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (354, 'table', 34, 'TV Stand', 32, 2921188, 351211, '2023-07-27', 314, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (355, 'table', 84, 'Wardrobe', 15, 12527471, 357129, '2023-08-20', 1903, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (356, 'desk', 58, 'Desk', 55, 10687241, 294800, '2023-07-09', 1486, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (357, 'sofa', 28, 'Bookshelf', 5, 1664324, 353880, '2023-08-21', 1970, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (358, 'table', 80, 'Dining Table', 43, 11767625, 707694, '2023-01-02', 1792, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (359, 'chair', 47, 'Bookshelf', 70, 2850409, 537327, '2022-12-21', 36, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (360, 'cabinet', 32, 'Dining Table', 44, 9802409, 560232, '2023-06-10', 677, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (361, 'sofa', 68, 'Sofa', 29, 14784260, 641402, '2023-07-21', 1549, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (362, 'cabinet', 73, 'Coffee Table', 38, 2875253, 329350, '2023-04-28', 114, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (363, 'sofa', 100, 'Sofa', 70, 17596067, 132934, '2022-12-01', 1543, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (364, 'sofa', 2, 'Chair', 96, 9161657, 139732, '2023-09-26', 390, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (365, 'cabinet', 78, 'Cabinet', 57, 11024910, 841369, '2023-01-11', 1913, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (366, 'cabinet', 11, 'TV Stand', 97, 10247298, 270743, '2023-01-10', 249, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (367, 'table', 69, 'TV Stand', 87, 1540716, 527801, '2023-06-08', 82, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (368, 'sofa', 68, 'Chair', 9, 15346581, 375018, '2023-08-11', 1986, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (369, 'chair', 16, 'Cabinet', 55, 9719684, 802835, '2023-05-28', 1737, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (370, 'desk', 18, 'Dining Table', 22, 13105770, 564635, '2023-08-20', 449, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (371, 'desk', 62, 'TV Stand', 26, 19644665, 397658, '2023-01-04', 902, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (372, 'sofa', 81, 'Wardrobe', 84, 18740108, 442752, '2023-11-05', 19, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (373, 'chair', 30, 'Chair', 80, 19713905, 725549, '2022-12-20', 1287, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (374, 'sofa', 81, 'Bookshelf', 94, 11121569, 712072, '2022-12-09', 1555, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (375, 'cabinet', 56, 'Cabinet', 94, 3700670, 362861, '2023-08-21', 340, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (376, 'desk', 43, 'TV Stand', 69, 2171244, 257966, '2023-03-12', 1747, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (377, 'chair', 88, 'Desk', 1, 10890529, 851885, '2023-07-26', 428, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (378, 'cabinet', 13, 'Chair', 35, 13271119, 495353, '2023-08-12', 842, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (379, 'table', 15, 'Dining Table', 22, 6357021, 828999, '2023-07-20', 1808, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (380, 'desk', 62, 'Wardrobe', 92, 18718608, 323375, '2023-07-30', 1071, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (381, 'table', 12, 'Dining Table', 72, 10169696, 363671, '2023-10-30', 1922, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (382, 'sofa', 30, 'Bed', 58, 9741784, 296703, '2023-10-04', 1563, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (383, 'table', 49, 'Bookshelf', 84, 17210147, 287673, '2023-11-05', 284, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (384, 'chair', 21, 'Chair', 35, 15764541, 555593, '2022-12-22', 1366, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (385, 'sofa', 41, 'Sofa', 4, 10050900, 413021, '2023-10-06', 875, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (386, 'sofa', 19, 'Cabinet', 42, 8953582, 182390, '2023-07-06', 1860, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (387, 'desk', 14, 'Coffee Table', 97, 7175819, 395564, '2023-01-13', 1767, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (388, 'desk', 10, 'Chair', 13, 4068513, 627596, '2023-08-23', 333, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (389, 'sofa', 98, 'Bookshelf', 49, 9367291, 146355, '2023-02-03', 2000, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (390, 'sofa', 53, 'Dining Table', 30, 19697820, 798128, '2023-02-18', 781, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (391, 'sofa', 85, 'Cabinet', 89, 5056658, 882254, '2023-10-31', 1089, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (392, 'chair', 19, 'Bookshelf', 74, 9103603, 484530, '2023-08-26', 947, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (393, 'sofa', 82, 'TV Stand', 21, 5061605, 136009, '2023-03-26', 980, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (394, 'desk', 28, 'Cabinet', 95, 10022728, 803509, '2022-12-13', 1954, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (395, 'table', 70, 'Cabinet', 1, 15960978, 550274, '2023-03-09', 1463, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (396, 'sofa', 28, 'Desk', 95, 2490006, 610417, '2023-08-24', 1550, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (397, 'sofa', 4, 'Wardrobe', 68, 10676420, 281646, '2023-02-02', 284, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (398, 'chair', 19, 'Cabinet', 88, 7253833, 136437, '2023-01-03', 1008, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (399, 'table', 62, 'Cabinet', 5, 1165726, 147529, '2023-05-01', 995, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (400, 'cabinet', 64, 'Dining Table', 43, 17114722, 486515, '2023-04-10', 729, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (401, 'cabinet', 82, 'Coffee Table', 24, 8567376, 329194, '2023-10-23', 1965, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (402, 'cabinet', 50, 'Cabinet', 100, 18751334, 412816, '2022-12-03', 722, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (403, 'table', 33, 'Cabinet', 50, 9778575, 404210, '2023-08-09', 1238, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (404, 'cabinet', 24, 'Dining Table', 74, 10104220, 498806, '2023-02-23', 1528, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (405, 'table', 1, 'Cabinet', 3, 1357932, 119267, '2023-01-12', 606, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (406, 'desk', 81, 'Sofa', 87, 4389197, 794418, '2023-06-06', 1412, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (407, 'table', 21, 'Coffee Table', 16, 8508771, 836394, '2023-01-17', 1715, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (408, 'table', 34, 'Sofa', 47, 18822635, 846073, '2023-10-10', 114, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (409, 'table', 96, 'Dining Table', 33, 11426182, 154259, '2023-03-31', 11, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (410, 'chair', 70, 'Dining Table', 91, 8661866, 642485, '2023-02-19', 1486, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (411, 'desk', 97, 'Coffee Table', 16, 12686206, 418487, '2023-05-02', 1734, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (412, 'desk', 22, 'TV Stand', 66, 8077243, 277834, '2023-11-14', 979, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (413, 'desk', 95, 'Dining Table', 34, 15261709, 581676, '2023-08-10', 330, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (414, 'sofa', 76, 'Dining Table', 27, 11776019, 291968, '2023-03-12', 1890, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (415, 'desk', 68, 'Sofa', 8, 11798434, 233393, '2023-10-30', 1567, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (416, 'sofa', 55, 'Dining Table', 13, 8002922, 587853, '2023-11-25', 136, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (417, 'table', 86, 'Sofa', 56, 16696932, 828130, '2023-02-16', 1605, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (418, 'table', 63, 'Wardrobe', 27, 2065516, 147161, '2023-05-16', 694, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (419, 'sofa', 58, 'Dining Table', 15, 15181223, 488127, '2023-01-05', 1513, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (420, 'cabinet', 19, 'Coffee Table', 27, 7673238, 664443, '2023-02-23', 335, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (421, 'sofa', 31, 'Chair', 18, 4644958, 871688, '2023-01-31', 1846, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (422, 'table', 84, 'TV Stand', 39, 6947170, 397462, '2023-10-20', 1099, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (423, 'desk', 90, 'Sofa', 50, 9643744, 142099, '2023-11-04', 662, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (424, 'desk', 28, 'Bookshelf', 99, 19992632, 760811, '2023-08-30', 1499, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (425, 'sofa', 85, 'Cabinet', 32, 12830890, 518145, '2023-07-01', 1663, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (426, 'sofa', 87, 'Wardrobe', 46, 1579968, 332550, '2023-09-02', 14, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (427, 'chair', 71, 'Coffee Table', 42, 9530148, 117058, '2023-05-05', 426, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (428, 'chair', 3, 'Bookshelf', 96, 10972064, 475161, '2023-06-08', 609, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (429, 'sofa', 43, 'Coffee Table', 88, 8030509, 434251, '2023-05-17', 1079, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (430, 'cabinet', 2, 'Cabinet', 85, 13340125, 266742, '2023-01-14', 1615, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (431, 'sofa', 25, 'Dining Table', 22, 19719535, 608725, '2022-12-09', 1092, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (432, 'chair', 60, 'Chair', 41, 11362912, 419297, '2023-05-07', 1661, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (433, 'desk', 17, 'Bed', 97, 11142891, 243196, '2023-03-19', 536, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (434, 'table', 54, 'Bed', 88, 3084544, 358518, '2023-08-27', 106, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (435, 'table', 90, 'Bed', 39, 17639391, 112384, '2023-05-26', 1224, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (436, 'sofa', 39, 'Wardrobe', 18, 9540942, 150673, '2022-12-20', 713, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (437, 'chair', 7, 'Desk', 40, 14918120, 197280, '2023-07-11', 58, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (438, 'chair', 62, 'Wardrobe', 20, 10392835, 677429, '2023-08-05', 1638, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (439, 'desk', 68, 'TV Stand', 90, 7395590, 802010, '2023-06-08', 1816, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (440, 'table', 92, 'TV Stand', 95, 8508568, 459566, '2023-11-01', 511, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (441, 'chair', 53, 'TV Stand', 100, 16216821, 610756, '2023-07-01', 1534, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (442, 'chair', 10, 'Bookshelf', 70, 7529280, 898296, '2023-07-22', 1192, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (443, 'sofa', 100, 'Bookshelf', 75, 9770365, 326280, '2023-05-26', 166, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (444, 'desk', 60, 'Dining Table', 38, 11577597, 598545, '2022-12-31', 354, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (445, 'cabinet', 37, 'Bookshelf', 28, 12190244, 405366, '2023-05-25', 938, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (446, 'desk', 81, 'Wardrobe', 41, 18588323, 455530, '2023-10-06', 1768, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (447, 'cabinet', 57, 'Bookshelf', 17, 5982233, 404949, '2022-12-15', 1943, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (448, 'sofa', 57, 'Desk', 31, 13016087, 825680, '2023-02-06', 513, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (449, 'table', 6, 'TV Stand', 82, 10137346, 465107, '2023-04-24', 189, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (450, 'table', 92, 'Cabinet', 61, 4209732, 872547, '2023-09-18', 844, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (451, 'table', 98, 'TV Stand', 99, 2703786, 153673, '2023-03-28', 44, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (452, 'cabinet', 46, 'Bed', 49, 1590224, 566633, '2023-07-02', 1912, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (453, 'sofa', 95, 'Sofa', 39, 15151163, 275793, '2023-01-20', 265, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (454, 'table', 92, 'Sofa', 62, 5197207, 210034, '2022-12-09', 614, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (455, 'cabinet', 23, 'Bookshelf', 29, 19389814, 892158, '2022-12-26', 364, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (456, 'desk', 85, 'Bookshelf', 3, 13353125, 880376, '2023-04-13', 1342, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (457, 'desk', 83, 'Coffee Table', 34, 5920679, 531693, '2022-11-28', 1251, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (458, 'table', 73, 'Sofa', 96, 6670560, 567628, '2023-03-19', 337, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (459, 'chair', 26, 'Wardrobe', 99, 15906177, 209579, '2023-10-25', 639, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (460, 'sofa', 58, 'Cabinet', 37, 18320941, 579704, '2023-06-01', 498, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (461, 'sofa', 18, 'Bed', 16, 5070931, 577689, '2023-07-06', 1586, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (462, 'chair', 99, 'Cabinet', 12, 13110734, 351598, '2023-10-30', 1238, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (463, 'chair', 27, 'Desk', 31, 16103523, 577263, '2023-03-14', 868, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (464, 'cabinet', 72, 'TV Stand', 67, 14218653, 469449, '2023-03-27', 72, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (465, 'cabinet', 68, 'Bed', 35, 5944737, 570816, '2023-07-05', 1860, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (466, 'table', 20, 'TV Stand', 51, 8037121, 782288, '2023-04-23', 1307, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (467, 'table', 72, 'Chair', 7, 11756178, 799899, '2023-03-29', 120, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (468, 'desk', 95, 'Desk', 10, 1623306, 377255, '2023-03-06', 1782, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (469, 'desk', 86, 'Coffee Table', 55, 17713486, 352825, '2023-04-07', 138, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (470, 'cabinet', 38, 'Coffee Table', 16, 7175300, 308913, '2023-10-04', 707, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (471, 'chair', 23, 'Desk', 96, 11155390, 128348, '2023-08-29', 882, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (472, 'table', 54, 'Desk', 40, 4069159, 114293, '2023-05-20', 1164, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (473, 'cabinet', 61, 'TV Stand', 12, 2412757, 703785, '2023-03-06', 1951, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (474, 'desk', 35, 'Chair', 9, 1054294, 621395, '2023-04-23', 1440, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (475, 'table', 4, 'Coffee Table', 92, 8419642, 321127, '2023-03-09', 11, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (476, 'chair', 73, 'Desk', 3, 6561316, 684376, '2023-01-27', 696, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (477, 'sofa', 13, 'Sofa', 81, 6929153, 100012, '2023-02-05', 1351, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (478, 'desk', 5, 'Chair', 80, 6359482, 402782, '2023-11-09', 1146, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (479, 'desk', 25, 'Cabinet', 34, 19309760, 573016, '2023-10-07', 843, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (480, 'chair', 53, 'Bed', 32, 16018017, 239146, '2023-10-03', 515, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (481, 'table', 23, 'Coffee Table', 48, 2281849, 557745, '2023-09-04', 966, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (482, 'sofa', 28, 'Desk', 75, 16280880, 528910, '2023-04-19', 1926, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (483, 'chair', 79, 'Sofa', 38, 6878515, 654840, '2023-11-09', 78, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (484, 'cabinet', 90, 'Bed', 26, 6516305, 805126, '2023-05-17', 1967, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (485, 'cabinet', 40, 'Bookshelf', 69, 6009731, 802827, '2023-10-07', 1143, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (486, 'cabinet', 39, 'Wardrobe', 9, 11351111, 192553, '2023-03-21', 1537, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (487, 'table', 80, 'Bed', 97, 17730334, 784938, '2023-11-09', 15, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (488, 'chair', 59, 'Bookshelf', 1, 5318666, 701072, '2023-07-03', 1547, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (489, 'sofa', 71, 'Dining Table', 96, 1488994, 676186, '2023-05-31', 1750, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (490, 'sofa', 85, 'Sofa', 65, 17711634, 701955, '2023-11-06', 1927, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (491, 'desk', 95, 'Coffee Table', 62, 11185739, 844867, '2023-07-15', 517, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (492, 'desk', 77, 'Bookshelf', 3, 9019633, 230439, '2023-10-16', 393, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (493, 'chair', 90, 'Sofa', 54, 2337465, 113632, '2023-05-28', 703, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (494, 'chair', 95, 'Cabinet', 83, 15576229, 368887, '2023-10-08', 93, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (495, 'table', 45, 'Desk', 73, 11587803, 795062, '2022-12-14', 1263, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (496, 'table', 43, 'Coffee Table', 3, 16124129, 511401, '2023-01-16', 1506, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (497, 'sofa', 96, 'Coffee Table', 59, 18135267, 264881, '2023-10-02', 47, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (498, 'desk', 36, 'Dining Table', 27, 8142702, 455524, '2023-03-11', 1147, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (499, 'sofa', 25, 'Bed', 57, 2556486, 818466, '2023-02-23', 274, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (500, 'cabinet', 32, 'Wardrobe', 84, 17825808, 260577, '2023-06-29', 1154, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (501, 'sofa', 98, 'Bed', 56, 12142502, 614817, '2023-03-14', 404, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (502, 'sofa', 10, 'Bed', 54, 4288410, 718714, '2022-12-13', 1189, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (503, 'desk', 58, 'Sofa', 88, 7607717, 570695, '2023-01-30', 147, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (504, 'sofa', 1, 'Sofa', 84, 3233880, 528917, '2023-10-12', 1114, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (505, 'sofa', 58, 'Wardrobe', 91, 9208284, 708876, '2023-09-02', 960, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (506, 'cabinet', 9, 'TV Stand', 21, 9979457, 788331, '2023-09-15', 520, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (507, 'cabinet', 29, 'Bed', 57, 6271382, 234342, '2023-03-03', 1530, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (508, 'desk', 86, 'TV Stand', 92, 15407516, 544009, '2022-12-26', 784, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (509, 'sofa', 41, 'Bookshelf', 3, 5221398, 838591, '2023-06-01', 76, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (510, 'table', 37, 'Bookshelf', 7, 1435862, 757163, '2022-12-06', 798, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (511, 'desk', 31, 'Coffee Table', 99, 17044498, 384529, '2023-04-26', 197, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (512, 'desk', 53, 'Coffee Table', 20, 5009220, 256898, '2023-04-10', 631, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (513, 'chair', 36, 'Dining Table', 15, 3867666, 784270, '2023-11-22', 1813, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (514, 'table', 87, 'Chair', 40, 7460142, 105336, '2023-04-20', 1364, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (515, 'table', 60, 'Chair', 47, 15744547, 728540, '2023-11-23', 1955, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (516, 'table', 40, 'Bookshelf', 16, 6574569, 222956, '2022-11-29', 1277, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (517, 'table', 81, 'Chair', 78, 3573168, 402421, '2023-02-21', 1700, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (518, 'cabinet', 67, 'Sofa', 71, 7029217, 175679, '2023-05-06', 1943, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (519, 'chair', 13, 'Bed', 82, 13497859, 111843, '2022-12-04', 1423, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (520, 'sofa', 88, 'Coffee Table', 32, 1321567, 538586, '2023-06-11', 258, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (521, 'chair', 66, 'Sofa', 24, 11440560, 315960, '2023-03-18', 506, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (522, 'table', 73, 'Coffee Table', 50, 10210614, 883545, '2023-07-21', 1555, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (523, 'table', 97, 'Sofa', 96, 14332390, 279414, '2023-11-15', 1593, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (524, 'chair', 34, 'Sofa', 35, 6387861, 261791, '2023-04-12', 701, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (525, 'sofa', 50, 'Wardrobe', 13, 4608523, 520392, '2023-07-01', 554, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (526, 'desk', 27, 'Wardrobe', 44, 13437530, 165216, '2023-04-23', 769, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (527, 'chair', 73, 'Dining Table', 12, 7500783, 349513, '2023-05-29', 1364, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (528, 'table', 47, 'Sofa', 93, 10421076, 448395, '2023-03-20', 1220, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (529, 'table', 82, 'Coffee Table', 36, 6752439, 255379, '2023-08-22', 118, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (530, 'sofa', 23, 'Dining Table', 10, 10507483, 723125, '2023-08-30', 317, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (531, 'desk', 50, 'Cabinet', 96, 19393957, 425757, '2023-02-04', 1371, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (532, 'sofa', 55, 'Sofa', 58, 3873031, 633871, '2023-01-21', 162, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (533, 'cabinet', 37, 'Bookshelf', 79, 9039196, 567991, '2022-12-27', 714, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (534, 'desk', 63, 'Dining Table', 56, 17493415, 306863, '2023-08-08', 827, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (535, 'table', 11, 'TV Stand', 45, 14229336, 575419, '2023-11-13', 1496, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (536, 'sofa', 51, 'Desk', 76, 3796586, 552713, '2023-03-12', 768, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (537, 'chair', 100, 'Desk', 39, 10489555, 525520, '2023-06-30', 966, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (538, 'cabinet', 39, 'Chair', 65, 5293695, 836075, '2023-09-25', 1369, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (539, 'desk', 58, 'Bookshelf', 92, 16165827, 704526, '2023-05-27', 1062, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (540, 'sofa', 5, 'Coffee Table', 85, 13782851, 492542, '2023-11-15', 1354, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (541, 'chair', 37, 'Chair', 15, 16681038, 801094, '2023-11-13', 1356, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (542, 'sofa', 42, 'Coffee Table', 36, 4929049, 796160, '2023-09-02', 1534, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (543, 'cabinet', 10, 'Desk', 44, 11818150, 293257, '2023-08-18', 1337, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (544, 'desk', 16, 'Bookshelf', 57, 4738749, 875360, '2023-07-14', 687, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (545, 'chair', 72, 'Wardrobe', 66, 2254235, 623172, '2023-07-28', 1605, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (546, 'sofa', 80, 'Chair', 32, 10396497, 398794, '2022-12-04', 1749, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (547, 'cabinet', 31, 'Dining Table', 73, 14644424, 459451, '2023-04-20', 48, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (548, 'chair', 92, 'Coffee Table', 90, 15019706, 696423, '2023-07-07', 1117, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (549, 'desk', 81, 'Chair', 44, 12436034, 478689, '2023-03-22', 1223, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (550, 'cabinet', 71, 'Chair', 96, 1904700, 289676, '2023-07-12', 1675, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (551, 'sofa', 8, 'Desk', 12, 1538173, 550421, '2023-05-03', 156, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (552, 'cabinet', 17, 'Sofa', 46, 15056145, 248358, '2023-09-29', 1114, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (553, 'table', 6, 'Bed', 28, 5456018, 856517, '2023-02-03', 563, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (554, 'cabinet', 14, 'Cabinet', 58, 3816260, 452266, '2023-05-10', 815, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (555, 'desk', 72, 'Sofa', 36, 7457171, 827033, '2023-04-22', 1658, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (556, 'desk', 34, 'Wardrobe', 88, 7931862, 698563, '2023-11-20', 911, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (557, 'desk', 100, 'Sofa', 59, 16030699, 179528, '2023-04-07', 497, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (558, 'desk', 27, 'Wardrobe', 90, 11762514, 525557, '2023-11-07', 1916, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (559, 'desk', 46, 'Bookshelf', 2, 12296795, 694038, '2023-01-25', 1189, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (560, 'desk', 51, 'Coffee Table', 64, 15138010, 151007, '2023-10-30', 971, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (561, 'chair', 19, 'Coffee Table', 9, 13396237, 315975, '2023-01-14', 1910, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (562, 'sofa', 94, 'Desk', 81, 19239063, 582361, '2023-01-09', 396, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (563, 'desk', 4, 'Dining Table', 82, 5735863, 743887, '2023-07-26', 812, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (564, 'chair', 28, 'Dining Table', 31, 18220254, 662184, '2023-04-05', 1321, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (565, 'table', 87, 'TV Stand', 64, 1887935, 162941, '2023-03-02', 1947, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (566, 'table', 13, 'Bed', 90, 5563174, 706741, '2023-03-04', 1026, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (567, 'sofa', 66, 'Chair', 12, 18483491, 733721, '2023-07-04', 1226, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (568, 'cabinet', 42, 'Sofa', 56, 19598601, 547089, '2023-11-04', 576, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (569, 'cabinet', 30, 'Coffee Table', 66, 1627306, 377918, '2022-11-28', 1003, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (570, 'cabinet', 5, 'Bookshelf', 63, 4683410, 689260, '2023-09-28', 1653, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (571, 'table', 54, 'Bed', 19, 7897531, 792499, '2023-03-24', 1300, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (572, 'table', 42, 'Bed', 16, 14154911, 574810, '2023-02-11', 1722, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (573, 'desk', 51, 'Dining Table', 85, 4080489, 752437, '2023-01-16', 1496, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (574, 'table', 98, 'Desk', 90, 19275601, 503518, '2023-03-25', 1703, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (575, 'desk', 24, 'Cabinet', 1, 17252921, 701432, '2023-05-08', 1912, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (576, 'sofa', 21, 'Sofa', 50, 12440984, 234423, '2022-12-24', 119, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (577, 'table', 6, 'Dining Table', 98, 15778873, 512275, '2022-12-11', 1436, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (578, 'table', 71, 'Cabinet', 13, 17113226, 887147, '2023-05-16', 834, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (579, 'sofa', 36, 'TV Stand', 87, 7243826, 546288, '2023-07-29', 1702, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (580, 'sofa', 96, 'Dining Table', 17, 8171130, 365108, '2023-04-12', 1294, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (581, 'cabinet', 9, 'Bed', 95, 6157111, 267947, '2023-08-22', 9, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (582, 'sofa', 18, 'Cabinet', 65, 6363764, 460780, '2023-04-12', 707, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (583, 'desk', 70, 'Desk', 28, 10228845, 633514, '2023-05-23', 400, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (584, 'chair', 48, 'Dining Table', 7, 10894255, 810380, '2023-05-10', 987, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (585, 'table', 65, 'Wardrobe', 34, 5653064, 659352, '2023-10-08', 456, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (586, 'table', 95, 'Bed', 59, 13512397, 166896, '2023-08-14', 422, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (587, 'chair', 9, 'Bookshelf', 8, 6150238, 442487, '2023-09-23', 45, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (588, 'sofa', 30, 'Cabinet', 17, 16580869, 234214, '2023-05-30', 77, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (589, 'chair', 2, 'Chair', 21, 12144509, 725896, '2023-04-07', 1389, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (590, 'cabinet', 41, 'Wardrobe', 55, 8800643, 347023, '2023-06-27', 1301, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (591, 'cabinet', 71, 'Bookshelf', 36, 1659238, 707952, '2023-05-22', 1032, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (592, 'cabinet', 51, 'Dining Table', 70, 7498786, 213008, '2023-09-17', 16, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (593, 'cabinet', 98, 'TV Stand', 58, 1491447, 611705, '2023-03-21', 1159, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (594, 'sofa', 43, 'Dining Table', 92, 9581101, 750998, '2023-11-15', 1274, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (595, 'cabinet', 90, 'Wardrobe', 44, 6993127, 371840, '2023-07-01', 30, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (596, 'cabinet', 53, 'Bed', 61, 19616655, 436122, '2023-07-15', 324, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (597, 'sofa', 50, 'Bookshelf', 20, 10066309, 571056, '2022-12-24', 1274, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (598, 'sofa', 7, 'Bookshelf', 9, 5482685, 251906, '2023-03-31', 1161, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (599, 'chair', 2, 'Bed', 94, 14408517, 754709, '2022-12-08', 611, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (600, 'sofa', 71, 'Wardrobe', 9, 17044556, 501522, '2023-11-12', 700, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (601, 'cabinet', 95, 'Coffee Table', 9, 6044507, 837421, '2023-08-25', 97, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (602, 'desk', 31, 'Desk', 75, 19480333, 112790, '2022-12-22', 704, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (603, 'sofa', 77, 'Desk', 12, 5998499, 808243, '2023-10-31', 549, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (604, 'chair', 51, 'Dining Table', 3, 6717642, 799225, '2023-07-17', 1598, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (605, 'table', 37, 'Bookshelf', 41, 17004917, 259585, '2023-04-11', 1985, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (606, 'table', 46, 'Coffee Table', 60, 1497487, 327657, '2023-04-10', 1980, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (607, 'cabinet', 22, 'Bed', 12, 9465749, 806462, '2023-01-20', 1649, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (608, 'cabinet', 56, 'TV Stand', 39, 11925215, 522989, '2023-05-24', 602, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (609, 'table', 16, 'Desk', 65, 6464123, 799636, '2023-09-14', 1642, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (610, 'sofa', 68, 'Desk', 21, 4075658, 816575, '2023-07-03', 749, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (611, 'desk', 17, 'Coffee Table', 12, 6491194, 774337, '2023-09-24', 1769, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (612, 'chair', 74, 'Sofa', 28, 3306217, 612234, '2023-10-06', 1099, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (613, 'cabinet', 19, 'TV Stand', 15, 7990632, 660136, '2023-01-27', 1505, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (614, 'desk', 29, 'Dining Table', 45, 16555263, 529796, '2023-01-07', 1818, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (615, 'cabinet', 37, 'Cabinet', 1, 19289068, 667598, '2023-06-21', 1501, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (616, 'sofa', 19, 'Sofa', 9, 11492221, 647819, '2023-09-03', 1118, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (617, 'chair', 87, 'Desk', 77, 12722024, 761347, '2022-12-07', 489, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (618, 'chair', 97, 'Dining Table', 7, 5294605, 744779, '2023-08-12', 784, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (619, 'sofa', 36, 'Dining Table', 50, 14376511, 409247, '2023-08-18', 1847, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (620, 'desk', 25, 'Coffee Table', 92, 10484735, 438918, '2023-09-30', 1591, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (621, 'desk', 25, 'Chair', 1, 15404186, 227599, '2023-04-25', 1163, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (622, 'sofa', 49, 'Coffee Table', 7, 17203217, 373718, '2023-10-27', 1595, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (623, 'sofa', 84, 'Bookshelf', 10, 2057140, 768976, '2023-08-07', 1673, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (624, 'table', 66, 'Cabinet', 53, 14695571, 696266, '2023-06-09', 1642, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (625, 'sofa', 59, 'Sofa', 41, 16194357, 745026, '2023-06-04', 1332, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (626, 'table', 52, 'Bookshelf', 96, 9240017, 825047, '2023-01-19', 1666, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (627, 'chair', 29, 'Sofa', 54, 15332294, 648023, '2023-09-28', 1278, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (628, 'sofa', 58, 'Dining Table', 20, 16272108, 309808, '2023-05-25', 294, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (629, 'chair', 71, 'Bed', 51, 9210973, 623832, '2023-03-28', 378, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (630, 'cabinet', 73, 'Coffee Table', 15, 17073423, 155131, '2023-08-24', 1170, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (631, 'cabinet', 39, 'Coffee Table', 26, 9114239, 749921, '2022-12-01', 863, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (632, 'table', 46, 'Desk', 10, 10610703, 533535, '2023-11-17', 1711, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (633, 'desk', 30, 'Wardrobe', 37, 19144204, 143130, '2023-10-07', 1288, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (634, 'desk', 70, 'Wardrobe', 76, 12931463, 728937, '2023-07-26', 761, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (635, 'chair', 87, 'TV Stand', 12, 6478802, 222527, '2023-07-25', 965, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (636, 'desk', 89, 'Sofa', 60, 16932295, 250378, '2023-09-07', 673, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (637, 'cabinet', 17, 'Wardrobe', 23, 15232698, 811152, '2023-06-26', 1402, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (638, 'table', 62, 'TV Stand', 13, 6205722, 338914, '2023-07-28', 920, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (639, 'table', 87, 'Bookshelf', 60, 7420717, 588343, '2023-09-01', 45, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (640, 'sofa', 59, 'Desk', 49, 9073312, 622864, '2023-11-13', 1988, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (641, 'cabinet', 22, 'Bed', 75, 5415215, 135756, '2023-07-14', 1665, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (642, 'table', 26, 'Chair', 68, 11484248, 403449, '2023-07-27', 1509, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (643, 'desk', 95, 'Dining Table', 60, 17649075, 773275, '2023-02-13', 869, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (644, 'sofa', 57, 'Bed', 79, 1351816, 721924, '2023-03-18', 1836, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (645, 'desk', 57, 'Desk', 45, 5684325, 293808, '2023-02-04', 293, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (646, 'table', 38, 'Sofa', 87, 4305181, 402924, '2023-07-30', 742, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (647, 'chair', 75, 'Coffee Table', 37, 11903408, 745826, '2023-04-20', 606, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (648, 'sofa', 41, 'Desk', 52, 17337073, 586705, '2023-01-18', 1714, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (649, 'table', 85, 'Cabinet', 32, 3071061, 218486, '2023-09-22', 687, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (650, 'desk', 88, 'Wardrobe', 34, 19415284, 198608, '2023-05-18', 1610, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (651, 'cabinet', 6, 'TV Stand', 4, 9904883, 777344, '2023-08-02', 1465, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (652, 'table', 50, 'Cabinet', 18, 6085986, 456173, '2023-05-26', 1190, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (653, 'chair', 84, 'Desk', 39, 13177966, 337942, '2023-05-25', 630, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (654, 'chair', 52, 'Bed', 49, 17864831, 734074, '2023-09-23', 1264, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (655, 'chair', 87, 'Sofa', 3, 15479612, 871867, '2023-05-09', 1206, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (656, 'sofa', 89, 'Wardrobe', 97, 6377864, 863212, '2023-02-15', 1036, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (657, 'cabinet', 86, 'Bookshelf', 39, 19866281, 830161, '2023-08-24', 1112, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (658, 'chair', 12, 'Coffee Table', 8, 1696223, 560513, '2023-06-10', 1359, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (659, 'table', 47, 'Bookshelf', 3, 6852703, 632927, '2023-04-16', 465, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (660, 'cabinet', 40, 'Dining Table', 14, 16861462, 751962, '2023-04-11', 1391, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (661, 'table', 93, 'TV Stand', 32, 11544013, 367504, '2023-04-07', 672, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (662, 'table', 11, 'Coffee Table', 54, 12881856, 769070, '2023-09-09', 1035, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (663, 'table', 28, 'Cabinet', 21, 15296870, 561681, '2023-10-26', 1163, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (664, 'chair', 60, 'Dining Table', 19, 15223662, 468930, '2023-08-07', 280, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (665, 'chair', 80, 'Chair', 73, 17524243, 183911, '2023-03-20', 618, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (666, 'cabinet', 36, 'Desk', 39, 9040915, 863337, '2023-06-21', 425, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (667, 'chair', 12, 'TV Stand', 65, 8880643, 591888, '2023-02-15', 1295, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (668, 'cabinet', 17, 'Dining Table', 72, 18776380, 733450, '2023-01-09', 258, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (669, 'chair', 50, 'TV Stand', 29, 19882441, 844883, '2023-11-24', 13, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (670, 'cabinet', 8, 'Bed', 62, 6397423, 645002, '2023-05-10', 1689, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (671, 'table', 14, 'Chair', 95, 12413470, 471510, '2023-04-17', 1432, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (672, 'cabinet', 39, 'Bed', 6, 7179961, 186730, '2023-09-17', 993, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (673, 'desk', 88, 'TV Stand', 1, 12419796, 191847, '2023-04-13', 1538, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (674, 'desk', 59, 'Bookshelf', 33, 14721541, 791587, '2023-08-08', 992, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (675, 'sofa', 68, 'Sofa', 66, 16197560, 479115, '2023-03-22', 446, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (676, 'sofa', 33, 'Desk', 96, 15132707, 506730, '2023-02-04', 162, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (677, 'sofa', 97, 'Dining Table', 56, 15256044, 730897, '2022-12-03', 563, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (678, 'chair', 73, 'TV Stand', 1, 9983255, 851097, '2023-11-08', 881, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (679, 'chair', 55, 'TV Stand', 82, 11221252, 640051, '2023-02-03', 1229, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (680, 'sofa', 6, 'Wardrobe', 14, 9681833, 121194, '2023-05-18', 674, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (681, 'table', 58, 'TV Stand', 52, 1685387, 150875, '2023-02-10', 1933, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (682, 'cabinet', 24, 'Desk', 71, 6169701, 620160, '2023-10-21', 675, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (683, 'table', 3, 'Desk', 73, 4297190, 895499, '2023-06-30', 1783, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (684, 'sofa', 12, 'Desk', 20, 18101071, 442708, '2023-06-20', 1751, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (685, 'sofa', 34, 'Chair', 91, 11383366, 864166, '2023-06-27', 1463, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (686, 'desk', 89, 'Cabinet', 59, 16043579, 414350, '2023-02-06', 208, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (687, 'sofa', 33, 'Cabinet', 40, 17794220, 566972, '2023-04-10', 266, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (688, 'chair', 36, 'Chair', 2, 18940574, 654940, '2023-09-06', 101, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (689, 'cabinet', 43, 'Sofa', 24, 10421648, 644203, '2023-03-02', 971, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (690, 'desk', 26, 'Bookshelf', 2, 16969530, 619745, '2023-09-27', 920, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (691, 'sofa', 22, 'Coffee Table', 54, 2216350, 357776, '2023-10-02', 31, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (692, 'chair', 51, 'Coffee Table', 90, 9565662, 598414, '2023-06-24', 847, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (693, 'chair', 53, 'Bookshelf', 1, 7489209, 379834, '2023-10-17', 195, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (694, 'cabinet', 85, 'Bed', 6, 6168843, 597985, '2023-05-13', 1864, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (695, 'cabinet', 23, 'Wardrobe', 59, 15242675, 302447, '2023-08-10', 605, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (696, 'sofa', 6, 'Cabinet', 88, 13923033, 562353, '2023-06-30', 1775, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (697, 'cabinet', 7, 'Coffee Table', 82, 5902692, 595679, '2023-09-01', 117, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (698, 'desk', 2, 'TV Stand', 75, 6143665, 375114, '2023-05-25', 599, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (699, 'cabinet', 61, 'Coffee Table', 39, 18354187, 279846, '2023-01-10', 615, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (700, 'sofa', 46, 'Chair', 60, 5980928, 263022, '2023-02-18', 1697, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (701, 'cabinet', 68, 'TV Stand', 2, 5431972, 239737, '2023-05-15', 228, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (702, 'chair', 77, 'Dining Table', 63, 7396387, 478274, '2023-03-18', 96, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (703, 'table', 84, 'TV Stand', 67, 12152736, 170620, '2023-01-31', 1643, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (704, 'table', 50, 'Cabinet', 9, 17944127, 337098, '2023-03-26', 526, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (705, 'table', 22, 'Sofa', 70, 15013086, 342412, '2023-04-10', 1572, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (706, 'table', 43, 'Cabinet', 22, 17321227, 352370, '2023-01-20', 1330, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (707, 'desk', 60, 'Bed', 35, 13281725, 400722, '2022-12-03', 1541, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (708, 'table', 62, 'Dining Table', 29, 13202964, 117653, '2023-06-26', 1442, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (709, 'cabinet', 34, 'Sofa', 68, 16754302, 597782, '2023-08-13', 670, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (710, 'table', 11, 'Desk', 34, 17599787, 227711, '2023-11-24', 1753, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (711, 'chair', 1, 'Dining Table', 96, 15161094, 307312, '2023-02-19', 1320, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (712, 'table', 96, 'Dining Table', 42, 11905177, 717689, '2023-10-13', 1116, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (713, 'chair', 29, 'TV Stand', 27, 14686920, 330069, '2023-08-06', 1784, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (714, 'cabinet', 69, 'Coffee Table', 21, 9823475, 395043, '2023-06-25', 167, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (715, 'desk', 84, 'Cabinet', 59, 11341529, 146411, '2023-09-21', 1647, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (716, 'chair', 84, 'Coffee Table', 51, 11082632, 581342, '2023-04-30', 928, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (717, 'sofa', 60, 'Chair', 75, 8947580, 774914, '2023-05-25', 1055, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (718, 'cabinet', 97, 'Sofa', 43, 2830799, 855156, '2022-12-12', 25, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (719, 'chair', 2, 'Cabinet', 1, 4965369, 626224, '2023-10-17', 765, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (720, 'cabinet', 10, 'Bed', 90, 11131889, 770331, '2023-02-12', 1777, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (721, 'chair', 12, 'Desk', 41, 5083819, 549169, '2023-05-24', 602, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (722, 'table', 37, 'Cabinet', 69, 17210351, 404110, '2023-03-28', 829, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (723, 'desk', 92, 'Dining Table', 75, 12066586, 559628, '2023-10-16', 1993, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (724, 'table', 12, 'Chair', 4, 8619624, 800916, '2023-09-25', 153, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (725, 'table', 78, 'Wardrobe', 97, 3636468, 733028, '2022-12-05', 1478, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (726, 'chair', 6, 'Wardrobe', 13, 18601158, 889283, '2023-08-03', 514, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (727, 'table', 27, 'Wardrobe', 15, 13445687, 824920, '2023-05-12', 1776, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (728, 'desk', 3, 'Sofa', 82, 7124419, 225180, '2023-05-01', 33, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (729, 'chair', 1, 'Dining Table', 78, 2325293, 338144, '2023-04-19', 1479, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (730, 'cabinet', 97, 'Cabinet', 14, 18968956, 593297, '2022-12-13', 213, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (731, 'cabinet', 78, 'Cabinet', 68, 10747232, 738125, '2023-09-12', 1624, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (732, 'desk', 20, 'Desk', 100, 3083061, 221602, '2023-01-01', 1644, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (733, 'table', 81, 'Chair', 31, 11791858, 385832, '2023-01-30', 1710, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (734, 'sofa', 55, 'Coffee Table', 33, 10636734, 351120, '2023-07-12', 316, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (735, 'table', 58, 'Desk', 79, 16189598, 461329, '2023-07-19', 304, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (736, 'cabinet', 10, 'Bookshelf', 85, 18970225, 716165, '2023-03-31', 1762, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (737, 'desk', 48, 'Dining Table', 7, 6479002, 721431, '2023-01-19', 1531, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (738, 'cabinet', 99, 'Bed', 20, 12755173, 238278, '2023-11-21', 672, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (739, 'table', 69, 'Chair', 9, 18020369, 431010, '2023-07-17', 1281, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (740, 'table', 62, 'TV Stand', 34, 3509016, 807787, '2023-10-06', 1563, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (741, 'sofa', 78, 'Dining Table', 31, 13955744, 658952, '2023-02-06', 1697, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (742, 'chair', 63, 'Wardrobe', 25, 9219866, 294110, '2023-10-08', 1836, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (743, 'chair', 29, 'Bookshelf', 2, 1645310, 823070, '2023-01-28', 96, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (744, 'chair', 83, 'Bookshelf', 99, 9064956, 482847, '2023-09-10', 386, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (745, 'chair', 12, 'Chair', 55, 17882566, 525267, '2023-01-20', 33, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (746, 'chair', 72, 'Dining Table', 2, 4067797, 389433, '2023-01-18', 970, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (747, 'table', 95, 'Cabinet', 56, 10800790, 432825, '2023-04-22', 1301, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (748, 'chair', 73, 'Bookshelf', 58, 7551134, 413610, '2023-09-12', 118, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (749, 'table', 79, 'Wardrobe', 56, 12435744, 846504, '2023-10-25', 1144, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (750, 'desk', 61, 'Sofa', 76, 12697126, 589693, '2023-06-26', 826, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (751, 'chair', 58, 'Wardrobe', 72, 17121795, 551749, '2023-05-24', 1015, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (752, 'cabinet', 51, 'Cabinet', 2, 15222677, 796291, '2023-04-10', 1968, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (753, 'table', 4, 'Coffee Table', 13, 3925984, 302159, '2023-05-24', 1381, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (754, 'desk', 37, 'Coffee Table', 15, 5545485, 706271, '2023-07-18', 469, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (755, 'table', 47, 'Bed', 4, 16972732, 666843, '2023-01-11', 401, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (756, 'desk', 93, 'TV Stand', 11, 4056108, 511998, '2022-12-01', 1804, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (757, 'sofa', 65, 'Chair', 71, 5724927, 860830, '2023-06-18', 388, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (758, 'chair', 58, 'Desk', 17, 6672112, 240910, '2023-03-16', 148, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (759, 'cabinet', 11, 'Sofa', 70, 3747341, 264849, '2023-03-16', 1375, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (760, 'desk', 22, 'Cabinet', 60, 8468693, 893166, '2023-04-06', 963, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (761, 'sofa', 76, 'Desk', 37, 14817380, 121824, '2023-05-23', 472, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (762, 'chair', 91, 'Cabinet', 65, 17170136, 493356, '2023-11-27', 1285, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (763, 'sofa', 4, 'Desk', 26, 12727876, 569238, '2023-07-04', 116, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (764, 'sofa', 53, 'Dining Table', 5, 9796162, 795909, '2023-02-28', 1000, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (765, 'cabinet', 29, 'Sofa', 28, 16216303, 358695, '2023-10-19', 527, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (766, 'table', 61, 'Dining Table', 87, 13862279, 647387, '2023-02-24', 1121, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (767, 'desk', 37, 'Bookshelf', 11, 1739736, 733230, '2023-07-14', 1102, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (768, 'cabinet', 77, 'Wardrobe', 12, 10851505, 283208, '2022-12-16', 1085, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (769, 'chair', 22, 'TV Stand', 99, 12763194, 548977, '2023-02-23', 630, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (770, 'cabinet', 22, 'Cabinet', 22, 8336379, 561322, '2023-02-19', 1702, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (771, 'sofa', 86, 'Sofa', 16, 14902098, 802145, '2023-05-04', 1441, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (772, 'cabinet', 100, 'Bookshelf', 89, 8154739, 117918, '2023-07-30', 494, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (773, 'sofa', 32, 'Chair', 50, 18322917, 319758, '2023-02-21', 1530, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (774, 'desk', 31, 'Chair', 50, 19459960, 411673, '2023-10-27', 933, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (775, 'sofa', 70, 'Chair', 46, 1609534, 240675, '2023-09-29', 728, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (776, 'sofa', 100, 'Bookshelf', 49, 9645781, 329591, '2022-12-24', 522, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (777, 'table', 12, 'Dining Table', 92, 17669729, 511069, '2023-08-06', 686, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (778, 'cabinet', 44, 'Desk', 40, 2813008, 261955, '2023-05-26', 1498, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (779, 'chair', 36, 'Desk', 34, 19838612, 435801, '2023-05-24', 1530, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (780, 'cabinet', 30, 'Desk', 66, 1854567, 771079, '2023-05-17', 1313, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (781, 'desk', 68, 'Coffee Table', 51, 16805742, 503573, '2023-10-08', 1631, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (782, 'cabinet', 9, 'Coffee Table', 67, 9597020, 625340, '2023-02-10', 329, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (783, 'desk', 75, 'Sofa', 84, 14655440, 202440, '2023-03-24', 1466, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (784, 'sofa', 72, 'Wardrobe', 61, 11655549, 737700, '2023-06-06', 1154, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (785, 'cabinet', 9, 'Chair', 82, 13954090, 282367, '2023-01-07', 145, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (786, 'desk', 100, 'TV Stand', 49, 11657332, 106708, '2023-02-18', 579, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (787, 'cabinet', 36, 'Bookshelf', 4, 6880032, 238758, '2023-03-09', 1044, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (788, 'desk', 21, 'TV Stand', 26, 11194661, 670608, '2023-09-17', 1369, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (789, 'sofa', 20, 'Bookshelf', 68, 11979452, 102916, '2023-08-28', 627, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (790, 'cabinet', 42, 'Coffee Table', 12, 3868691, 222905, '2023-06-27', 1103, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (791, 'chair', 97, 'Dining Table', 75, 1331942, 181931, '2023-08-20', 1686, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (792, 'table', 40, 'Coffee Table', 74, 1529068, 222759, '2023-07-25', 1504, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (793, 'sofa', 24, 'Dining Table', 86, 17940863, 522053, '2022-12-27', 141, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (794, 'table', 97, 'Sofa', 60, 10756641, 793415, '2022-11-30', 1940, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (795, 'sofa', 51, 'Dining Table', 88, 1075949, 370188, '2023-11-09', 644, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (796, 'table', 75, 'Chair', 35, 8030439, 822643, '2023-10-19', 1210, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (797, 'desk', 13, 'Bed', 81, 19449898, 149745, '2023-08-22', 829, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (798, 'table', 3, 'Bed', 89, 18731713, 880122, '2022-12-13', 550, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (799, 'table', 56, 'Coffee Table', 25, 12273798, 887203, '2023-08-22', 1486, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (800, 'desk', 54, 'Cabinet', 17, 16993415, 446891, '2023-09-08', 1686, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (801, 'sofa', 31, 'Bed', 76, 8463459, 661040, '2023-07-13', 571, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (802, 'table', 25, 'Chair', 99, 16188450, 683706, '2023-08-05', 1772, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (803, 'sofa', 70, 'Chair', 32, 7920893, 372469, '2023-07-11', 1037, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (804, 'table', 68, 'Dining Table', 32, 8709796, 665996, '2023-03-11', 22, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (805, 'chair', 4, 'Chair', 92, 8127121, 776537, '2022-12-14', 1365, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (806, 'sofa', 19, 'Bed', 51, 2758553, 733657, '2023-02-04', 1490, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (807, 'chair', 53, 'Chair', 38, 13886298, 242844, '2023-10-19', 149, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (808, 'sofa', 64, 'Bookshelf', 18, 8366359, 407472, '2023-05-26', 322, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (809, 'chair', 56, 'Sofa', 100, 3601731, 716248, '2023-07-16', 1837, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (810, 'sofa', 75, 'Dining Table', 50, 5461220, 270306, '2023-03-18', 1778, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (811, 'chair', 79, 'Wardrobe', 87, 2920002, 316795, '2023-10-06', 1638, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (812, 'cabinet', 60, 'Dining Table', 67, 6707835, 819727, '2023-05-31', 246, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (813, 'sofa', 47, 'Bed', 26, 5025730, 776178, '2023-09-17', 1111, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (814, 'sofa', 53, 'Wardrobe', 33, 3859950, 427699, '2023-11-08', 1196, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (815, 'chair', 87, 'Desk', 47, 4019086, 428778, '2023-09-11', 705, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (816, 'sofa', 93, 'Wardrobe', 96, 12721081, 897050, '2023-04-28', 1305, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (817, 'chair', 46, 'Bookshelf', 73, 6342134, 365497, '2023-02-17', 1368, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (818, 'chair', 28, 'TV Stand', 82, 19614518, 216145, '2023-04-30', 639, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (819, 'sofa', 76, 'Cabinet', 74, 8331134, 178207, '2023-06-09', 546, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (820, 'table', 3, 'Sofa', 65, 16505747, 883483, '2023-06-06', 1517, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (821, 'cabinet', 13, 'Bed', 21, 6253125, 484222, '2023-06-09', 573, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (822, 'cabinet', 87, 'Chair', 18, 13638666, 640983, '2023-02-24', 1957, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (823, 'sofa', 28, 'Chair', 92, 17553512, 611148, '2023-08-23', 597, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (824, 'sofa', 53, 'Wardrobe', 55, 12309099, 864363, '2023-08-19', 1972, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (825, 'chair', 20, 'Dining Table', 7, 16114347, 487633, '2023-10-07', 611, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (826, 'chair', 2, 'TV Stand', 87, 13486045, 320462, '2023-02-25', 321, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (827, 'chair', 51, 'Bed', 15, 17009212, 670743, '2023-11-14', 832, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (828, 'cabinet', 43, 'Dining Table', 67, 1857291, 619143, '2022-12-27', 1731, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (829, 'cabinet', 80, 'Wardrobe', 2, 16101733, 255060, '2022-11-30', 210, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (830, 'cabinet', 26, 'Desk', 40, 10359148, 294570, '2023-07-02', 900, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (831, 'chair', 94, 'Bookshelf', 9, 8138599, 721122, '2023-11-13', 1764, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (832, 'table', 63, 'TV Stand', 78, 8075136, 692006, '2023-10-28', 556, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (833, 'table', 16, 'Bed', 46, 2895285, 293788, '2023-02-24', 1964, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (834, 'chair', 62, 'Bookshelf', 27, 4339904, 501162, '2023-09-16', 419, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (835, 'table', 71, 'Bed', 57, 11212091, 792451, '2022-12-04', 144, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (836, 'chair', 41, 'Chair', 94, 2009299, 400039, '2023-06-03', 640, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (837, 'cabinet', 79, 'Chair', 47, 6617769, 770318, '2023-03-12', 1979, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (838, 'desk', 97, 'Cabinet', 37, 11323727, 570155, '2023-05-06', 1500, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (839, 'table', 55, 'Cabinet', 92, 18167258, 553557, '2023-01-02', 737, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (840, 'chair', 92, 'Coffee Table', 8, 19877863, 225817, '2023-10-03', 1664, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (841, 'table', 97, 'Dining Table', 58, 17809225, 752437, '2023-03-27', 1530, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (842, 'table', 86, 'Cabinet', 52, 6380344, 573415, '2023-06-26', 990, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (843, 'chair', 92, 'Sofa', 52, 4487374, 644925, '2023-08-15', 1350, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (844, 'table', 1, 'Dining Table', 84, 1829186, 378100, '2023-04-12', 725, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (845, 'chair', 32, 'Bookshelf', 91, 12025030, 212325, '2023-06-26', 1726, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (846, 'desk', 35, 'Cabinet', 56, 12478189, 503759, '2023-11-20', 406, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (847, 'table', 32, 'Desk', 90, 17795682, 512699, '2022-12-05', 1587, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (848, 'table', 19, 'Desk', 17, 12067881, 787601, '2023-06-23', 1508, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (849, 'cabinet', 59, 'Bookshelf', 71, 14604140, 836630, '2023-05-02', 528, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (850, 'sofa', 58, 'TV Stand', 79, 4948423, 380519, '2023-03-30', 1147, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (851, 'chair', 36, 'Chair', 46, 12550540, 288098, '2023-06-06', 556, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (852, 'desk', 73, 'Sofa', 40, 5985430, 609217, '2023-08-22', 7, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (853, 'sofa', 11, 'TV Stand', 52, 8899844, 680169, '2023-09-16', 874, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (854, 'sofa', 7, 'Cabinet', 99, 18524815, 577319, '2023-05-02', 1389, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (855, 'cabinet', 76, 'Chair', 35, 11391361, 866979, '2023-11-05', 47, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (856, 'table', 8, 'Bed', 50, 1639864, 185088, '2023-01-10', 1667, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (857, 'sofa', 50, 'Dining Table', 68, 6216126, 603994, '2023-08-26', 217, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (858, 'desk', 91, 'Sofa', 19, 2700002, 295747, '2023-10-02', 567, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (859, 'table', 11, 'Desk', 97, 15556258, 823791, '2023-04-10', 433, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (860, 'chair', 18, 'Bed', 36, 1430707, 128103, '2023-01-21', 50, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (861, 'cabinet', 83, 'Bookshelf', 86, 6031867, 678421, '2023-09-25', 1464, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (862, 'chair', 6, 'Sofa', 98, 1640466, 821054, '2023-08-10', 1825, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (863, 'sofa', 86, 'Sofa', 65, 16932172, 701953, '2023-04-08', 1618, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (864, 'table', 36, 'Chair', 99, 19319934, 895946, '2023-08-06', 897, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (865, 'cabinet', 29, 'TV Stand', 95, 2181671, 716466, '2023-03-26', 1089, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (866, 'chair', 59, 'Desk', 91, 2054596, 328948, '2023-11-01', 157, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (867, 'sofa', 19, 'Desk', 57, 4077394, 520246, '2023-09-27', 1955, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (868, 'sofa', 87, 'Coffee Table', 70, 17143509, 747074, '2023-08-26', 1199, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (869, 'chair', 13, 'Sofa', 91, 5146523, 291666, '2022-12-17', 1089, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (870, 'chair', 80, 'TV Stand', 31, 18690109, 464269, '2023-10-05', 1137, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (871, 'sofa', 80, 'Bookshelf', 12, 4973964, 627672, '2023-03-27', 920, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (872, 'cabinet', 82, 'Dining Table', 64, 12742998, 226429, '2023-03-25', 119, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (873, 'cabinet', 20, 'Bookshelf', 92, 5381638, 506291, '2023-01-26', 1969, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (874, 'sofa', 21, 'Wardrobe', 29, 15774680, 898460, '2023-08-26', 1286, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (875, 'sofa', 25, 'Cabinet', 12, 5656499, 831576, '2023-01-14', 1228, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (876, 'sofa', 58, 'Sofa', 73, 5948360, 428129, '2023-02-16', 1144, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (877, 'table', 34, 'Sofa', 49, 10763186, 266273, '2023-04-05', 1707, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (878, 'chair', 4, 'Coffee Table', 70, 8303210, 193417, '2023-09-01', 1550, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (879, 'sofa', 61, 'Dining Table', 27, 4600872, 406341, '2023-02-26', 1396, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (880, 'cabinet', 72, 'Bed', 31, 2477937, 299172, '2023-05-09', 1337, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (881, 'chair', 33, 'Desk', 48, 3265605, 109144, '2023-01-18', 410, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (882, 'chair', 36, 'Dining Table', 29, 4638725, 142346, '2023-07-19', 666, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (883, 'cabinet', 41, 'Dining Table', 84, 9143335, 768740, '2023-09-24', 818, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (884, 'sofa', 52, 'Coffee Table', 43, 4940478, 696336, '2022-12-02', 19, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (885, 'chair', 65, 'Sofa', 21, 8429968, 637092, '2023-07-04', 117, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (886, 'sofa', 89, 'TV Stand', 94, 14567642, 358664, '2023-03-30', 1739, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (887, 'cabinet', 77, 'Desk', 48, 18570680, 261702, '2023-08-31', 574, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (888, 'table', 44, 'Bookshelf', 74, 7418211, 243287, '2023-02-25', 367, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (889, 'cabinet', 61, 'Bookshelf', 75, 7643093, 305286, '2023-05-21', 1077, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (890, 'desk', 8, 'Cabinet', 43, 19166939, 571409, '2023-11-14', 1385, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (891, 'chair', 3, 'Cabinet', 61, 12485784, 867695, '2022-12-26', 1614, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (892, 'sofa', 72, 'Bed', 71, 12187796, 819793, '2023-11-04', 1871, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (893, 'chair', 46, 'Cabinet', 43, 15896952, 289640, '2023-09-09', 1597, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (894, 'table', 91, 'Desk', 68, 10790968, 249180, '2023-07-06', 122, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (895, 'desk', 95, 'Cabinet', 51, 5901960, 403475, '2023-11-25', 1813, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (896, 'chair', 19, 'Coffee Table', 92, 2077481, 493559, '2023-10-02', 1175, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (897, 'chair', 38, 'Cabinet', 28, 3673685, 791275, '2022-12-21', 1822, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (898, 'chair', 42, 'Sofa', 50, 16265169, 173374, '2023-03-29', 1392, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (899, 'cabinet', 56, 'Wardrobe', 97, 14413814, 107076, '2023-05-02', 1843, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (900, 'desk', 16, 'Chair', 23, 19922873, 865118, '2023-05-05', 712, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (901, 'chair', 88, 'Cabinet', 61, 3261487, 621669, '2023-11-27', 928, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (902, 'sofa', 32, 'Desk', 71, 6709749, 501139, '2023-01-26', 933, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (903, 'desk', 4, 'Desk', 37, 18464127, 378991, '2023-02-02', 1459, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (904, 'desk', 11, 'Bookshelf', 42, 5522587, 101872, '2023-04-21', 1587, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (905, 'desk', 81, 'Dining Table', 38, 19177320, 646308, '2023-04-21', 288, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (906, 'table', 60, 'Wardrobe', 25, 2169977, 865360, '2023-04-15', 666, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (907, 'sofa', 96, 'Chair', 29, 12850143, 797313, '2023-06-03', 804, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (908, 'sofa', 15, 'Dining Table', 70, 2663029, 377859, '2023-05-25', 1358, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (909, 'table', 88, 'Desk', 76, 10539617, 886946, '2023-11-13', 1859, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (910, 'cabinet', 63, 'TV Stand', 61, 12421177, 230094, '2022-12-10', 1193, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (911, 'desk', 6, 'Bookshelf', 46, 14346465, 592158, '2023-03-05', 277, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (912, 'sofa', 46, 'Bed', 49, 7992064, 309127, '2023-05-15', 453, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (913, 'cabinet', 33, 'Sofa', 84, 2414569, 893227, '2023-02-21', 215, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (914, 'cabinet', 25, 'Desk', 69, 6539573, 894834, '2023-07-24', 136, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (915, 'sofa', 92, 'Dining Table', 4, 15169238, 274622, '2022-11-29', 998, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (916, 'desk', 6, 'Dining Table', 61, 5830212, 702961, '2023-05-14', 386, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (917, 'sofa', 44, 'Coffee Table', 57, 4821929, 622112, '2023-05-11', 786, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (918, 'cabinet', 90, 'Wardrobe', 11, 12556874, 720245, '2023-06-12', 1395, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (919, 'sofa', 5, 'Cabinet', 37, 17832560, 785705, '2023-07-24', 1063, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (920, 'desk', 31, 'Bookshelf', 79, 9617596, 241616, '2023-05-29', 769, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (921, 'cabinet', 36, 'Dining Table', 48, 8541996, 111673, '2023-04-25', 371, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (922, 'desk', 24, 'Bed', 83, 11719665, 265901, '2023-04-27', 1880, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (923, 'cabinet', 70, 'Dining Table', 38, 1278795, 352737, '2023-09-03', 788, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (924, 'table', 2, 'Cabinet', 47, 15973093, 436882, '2023-08-04', 672, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (925, 'sofa', 86, 'Bed', 77, 19134152, 685786, '2022-12-18', 1141, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (926, 'chair', 97, 'Dining Table', 62, 13519213, 889221, '2023-05-08', 1114, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (927, 'sofa', 56, 'Cabinet', 29, 14878851, 799494, '2023-01-15', 213, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (928, 'desk', 62, 'Chair', 98, 9269650, 455990, '2023-03-24', 140, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (929, 'sofa', 83, 'Desk', 31, 2410916, 419103, '2023-05-28', 1337, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (930, 'table', 95, 'Cabinet', 99, 14738332, 579012, '2022-12-04', 415, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (931, 'table', 41, 'Sofa', 71, 3107900, 329663, '2023-07-27', 1997, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (932, 'sofa', 26, 'Bookshelf', 26, 13310563, 826890, '2023-07-10', 360, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (933, 'desk', 78, 'Chair', 9, 18141310, 256704, '2022-11-28', 1494, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (934, 'sofa', 32, 'Desk', 41, 9357790, 359687, '2023-05-23', 1108, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (935, 'desk', 51, 'Sofa', 84, 9239286, 621460, '2023-05-06', 770, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (936, 'chair', 13, 'Dining Table', 33, 12575874, 337296, '2023-10-09', 726, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (937, 'table', 55, 'Dining Table', 75, 3032196, 178233, '2023-02-05', 1838, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (938, 'desk', 80, 'Bookshelf', 17, 16210634, 407990, '2023-11-11', 835, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (939, 'cabinet', 41, 'Bookshelf', 70, 9462745, 393028, '2023-11-21', 408, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (940, 'sofa', 74, 'Dining Table', 96, 8919081, 768795, '2023-05-13', 37, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (941, 'chair', 23, 'Bed', 26, 13615024, 379287, '2023-03-02', 1857, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (942, 'chair', 58, 'Wardrobe', 88, 9906992, 204858, '2023-08-17', 452, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (943, 'desk', 14, 'Chair', 100, 3767110, 652623, '2023-09-12', 582, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (944, 'sofa', 61, 'Desk', 59, 7354288, 824145, '2023-07-24', 824, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (945, 'cabinet', 1, 'TV Stand', 3, 10413950, 708585, '2023-03-08', 1284, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (946, 'table', 97, 'Desk', 77, 3581587, 217577, '2023-06-09', 1651, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (947, 'desk', 93, 'Dining Table', 71, 17395974, 143279, '2023-05-19', 28, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (948, 'cabinet', 50, 'Bed', 24, 11410925, 749519, '2023-02-14', 1996, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (949, 'desk', 16, 'Desk', 76, 13210537, 174323, '2023-03-13', 1772, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (950, 'sofa', 25, 'Dining Table', 48, 1508906, 121783, '2023-08-10', 83, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (951, 'cabinet', 8, 'TV Stand', 66, 19166935, 370124, '2023-03-19', 1413, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (952, 'desk', 15, 'Coffee Table', 95, 3212785, 283645, '2023-06-15', 1228, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (953, 'sofa', 32, 'Bookshelf', 86, 5828075, 879177, '2023-04-17', 1331, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (954, 'desk', 82, 'Cabinet', 60, 11122596, 102377, '2023-01-11', 121, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (955, 'cabinet', 75, 'TV Stand', 72, 4009981, 303941, '2023-01-09', 216, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (956, 'table', 79, 'Cabinet', 80, 3837463, 830346, '2023-03-09', 193, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (957, 'table', 69, 'Bed', 57, 3415132, 210220, '2023-08-07', 19, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (958, 'table', 18, 'TV Stand', 4, 7842564, 520186, '2023-03-23', 1406, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (959, 'table', 4, 'Bed', 54, 19209007, 836086, '2023-04-02', 1977, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (960, 'table', 90, 'Desk', 95, 16593622, 842890, '2022-12-15', 1577, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (961, 'sofa', 27, 'Wardrobe', 9, 4680987, 370211, '2023-04-29', 1468, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (962, 'table', 18, 'Cabinet', 48, 18043011, 823649, '2023-06-01', 698, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (963, 'chair', 55, 'Bed', 14, 18329526, 247731, '2023-06-29', 1685, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (964, 'cabinet', 19, 'Cabinet', 34, 14698223, 870501, '2023-08-24', 1593, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (965, 'sofa', 77, 'Bookshelf', 28, 8791827, 354584, '2023-09-10', 1146, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (966, 'cabinet', 72, 'Desk', 14, 11661045, 780893, '2023-09-01', 552, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (967, 'cabinet', 85, 'Cabinet', 93, 2041335, 208531, '2023-11-02', 833, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (968, 'chair', 39, 'Bed', 96, 14438613, 474711, '2023-01-16', 708, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (969, 'table', 50, 'Bed', 10, 7109555, 807128, '2023-09-27', 991, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (970, 'sofa', 74, 'Sofa', 79, 4865508, 762554, '2023-06-16', 1811, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (971, 'table', 10, 'Bookshelf', 29, 7060356, 295022, '2023-01-25', 1179, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (972, 'chair', 9, 'Bed', 58, 12202534, 819985, '2023-05-21', 664, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (973, 'sofa', 18, 'Coffee Table', 85, 14509339, 725187, '2023-10-04', 1669, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (974, 'sofa', 39, 'Dining Table', 21, 19674889, 492141, '2023-04-29', 353, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (975, 'desk', 62, 'Cabinet', 86, 12223448, 202697, '2023-04-29', 1793, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (976, 'desk', 9, 'TV Stand', 34, 2736682, 691066, '2023-02-13', 781, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (977, 'desk', 50, 'Chair', 73, 10078237, 305340, '2023-07-15', 179, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (978, 'chair', 8, 'Wardrobe', 49, 14717767, 300046, '2023-04-18', 650, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (979, 'cabinet', 35, 'Desk', 37, 9679018, 689932, '2023-09-09', 1007, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (980, 'table', 87, 'Coffee Table', 86, 1823420, 275540, '2023-08-04', 827, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (981, 'desk', 72, 'Dining Table', 70, 3744569, 513562, '2023-07-18', 1043, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (982, 'sofa', 4, 'Dining Table', 66, 12752730, 644112, '2023-04-04', 761, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (983, 'desk', 98, 'Desk', 97, 18922212, 866841, '2022-12-05', 144, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (984, 'sofa', 96, 'TV Stand', 3, 11025845, 444760, '2023-07-07', 1991, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (985, 'desk', 3, 'Desk', 15, 11699790, 381389, '2022-12-01', 683, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (986, 'table', 51, 'Cabinet', 32, 2388942, 250131, '2023-08-16', 647, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (987, 'table', 75, 'Bookshelf', 97, 7814945, 738332, '2023-11-05', 1956, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (988, 'cabinet', 25, 'Bed', 79, 1209752, 381119, '2022-12-29', 675, 3);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (989, 'sofa', 55, 'Dining Table', 81, 13433518, 635168, '2023-02-19', 926, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (990, 'cabinet', 45, 'Bed', 98, 1458931, 652429, '2023-03-06', 861, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (991, 'sofa', 70, 'Bookshelf', 2, 19626599, 106592, '2023-01-22', 701, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (992, 'sofa', 28, 'Dining Table', 40, 17684781, 582344, '2023-05-30', 1976, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (993, 'table', 41, 'TV Stand', 97, 1564317, 731473, '2023-05-23', 1058, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (994, 'chair', 34, 'Bookshelf', 51, 17218825, 111476, '2023-02-17', 1520, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (995, 'desk', 69, 'Chair', 44, 15806382, 671266, '2023-08-12', 1162, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (996, 'table', 57, 'Wardrobe', 77, 18925017, 111861, '2023-03-04', 990, 2);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (997, 'chair', 31, 'Desk', 25, 5689401, 246558, '2023-08-03', 263, 1);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (998, 'table', 19, 'Dining Table', 82, 4792404, 786603, '2023-03-09', 1441, 4);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (999, 'chair', 40, 'Coffee Table', 10, 17587644, 856851, '2023-09-29', 1215, 5);
insert into products (id, productsName, brandID, productsDescription, categoryID, price, discount, lastUpdated, amountSold, statusID) values (1000, 'chair', 5, 'Sofa', 63, 5769464, 632805, '2023-01-31', 1582, 5);
GO

select * from products
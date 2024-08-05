CREATE DATABASE SammiShoppppppp
GO

USE SammiShoppppppp
GO

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    ParentCategoryID INT,
    FOREIGN KEY (ParentCategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    DiscountedPrice DECIMAL(10, 2),
    Sale INT,
    SKU VARCHAR(100) NOT NULL,
    Status INT,
    ImageURL VARCHAR(255),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    Address TEXT,
    PaymentMethod VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    ShippingAddress TEXT,
    OrderStatus VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    PaymentMethod VARCHAR(50),
    PaymentDate DATETIME NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE DiscountCodes (
    DiscountCodeID INT PRIMARY KEY IDENTITY(1,1),
    Code VARCHAR(50) NOT NULL,
    DiscountPercentage DECIMAL(5, 2),
    MaxDiscountAmount DECIMAL(10, 2),
    MinOrderAmount DECIMAL(10, 2),
    ValidFrom DATETIME NOT NULL,
    ValidTo DATETIME NOT NULL
)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Trang điểm', NULL),
       (N'Chăm sóc da', NULL),
       (N'Chăm sóc cơ thể', NULL),
       (N'Chăm sóc sức khỏe', NULL),
       (N'Chăm sóc tóc', NULL)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Trang điểm mặt', 1),
       (N'Trang điểm môi', 1),
       (N'Trang điểm mắt', 1),
       (N'Dụng cụ trang điểm', 1)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Kem lót', 6),
       (N'Kem nền', 6),
       (N'Phấn nước', 6),
       (N'Che khuyết điểm', 6),
       (N'Xịt khóa Makeup', 6)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Son kem', 7),
       (N'Son thỏi', 7),
       (N'Chì kẻ môi', 7),
       (N'Son dưỡng', 7)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Chì kẻ mày', 8),
       (N'Phấn mắt', 8),
       (N'Kẻ mắt', 8),
       (N'Chuốt mi', 8)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Bông tẩy trang', 9),
       (N'Lông mi giả', 9),
       (N'Cọ trang điểm', 9),
       (N'Dụng cụ rửa cọ', 9)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Làm sạch da', 2),
       (N'Chăm sóc da', 2),
       (N'Mặt nạ', 2),
       (N'Kem chống nắng', 2)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Sữa rửa mặt', 10),
       (N'Nước tẩy trang', 10),
       (N'Dầu tẩy trang', 10),
       (N'Sáp tẩy trang', 10)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Nước hoa hồng', 11),
       (N'Tinh chất', 11),
       (N'Kem dưỡng ẩm', 11),
       (N'Kem dưỡng mắt', 11),
	   (N'Xịt khoáng', 11)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Mặt nạ giấy', 12),
       (N'Mặt nạ ngủ', 12),
       (N'Mặt nạ môi', 12),
       (N'Mặt nạ mắt', 12)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Kem chống nắng mặt', 13),
       (N'Kem chống nắng toàn thân', 13),
       (N'Xịt chống nắng', 13)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Xà phòng', 14),
       (N'Sữa tắm', 14),
       (N'Tẩy da chết cơ thể', 14),
       (N'Rửa tay', 14)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Kem dưỡng body', 15),
       (N'Kem dưỡng da tay', 15),
       (N'Kem dưỡng gót chân', 15),
       (N'Dầu dừa', 15)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Bấm móng', 16),
       (N'Dao cạo chân mày', 16),
       (N'Nhíp', 16),
       (N'Dao cạo lông mặt', 16)
GO


INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Thức uống làm đẹp', 17),
       (N'Thực phẩm bảo vệ sức khỏe', 17)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Khẩu trang', 18),
       (N'Dung dịch nhỏ mắt', 18)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Sữa tắm em bé', 19),
       (N'Bàn chải đánh răng trẻ em', 19),
       (N'Nước súc miệng trẻ em', 19)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Dầu gội', 20),
       (N'Dầu gội khô', 20),
       (N'Dầu xả', 20)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Kem ủ tóc', 21),
       (N'Mặt nạ dưỡng tóc', 21),
       (N'Xịt dưỡng tóc', 21),
       (N'Dầu dưỡng tóc', 21)
GO

INSERT INTO Categories (Name, ParentCategoryID)
VALUES (N'Thuốc nhuộm', 22),
       (N'Phủ bạc', 22)
GO

INSERT INTO Products (Name, [Description], Price, DiscountedPrice, Sale, SKU, Status, CategoryID, ImageURL)
VALUES (N'Maybelline Kem Lót FitMe Matte + Poreless Primer 30ml', N'Kem lót Maybelline Fit Me Matte + Poreless Primer với khả năng kiềm dầu, làm mờ lỗ chân lông và giữ lớp trang điểm của bạn bền đẹp suốt cả ngày. Hiệu ứng kiểm soát dầu kéo dài đến 16 giờ, giúp làn da trông mịn màng và không tì vết.', 228000.00, 171000.00, '-25', 'BL-00015739', 58, 23, 'https://product.hstatic.net/200000551679/product/maybelline_1-18_ad1caf965b874362968b95c8d86e635e_grande.png'),
       (N'FOX Kem lót High Definition Foundation Primer làm sáng và mịn da - SB03 (30ml)', N'Kem lót F.O.X High Definition Foundation Primer ngoài công dụng nâng tone da còn có tác dụng cân bằng độ ẩm, kiểm soát dầu. Siêu bền màu, duy trì lớp make up cả ngày.', 580000.00, 406000.00, '-30', 'BL-00008419', 30, 23, 'https://product.hstatic.net/200000551679/product/untitled-1-09_5e58c73f5eb94ec29245277963d1b45a_grande.png'),
       (N'Cezanne Kem Lót chống nắng UV Tone Up Base 30g', N'Kem lót chống nắng Cezanne UV Tone Up Base giúp làn da của bạn trở nên căng bóng và tươi sáng ngay khi thoa.', 280000.00 , 224000.00, '-20', 'BL-00023983', 5, 23, 'https://product.hstatic.net/200000551679/product/cezanne-05_9f4748ff847740e7a7a601c731450c76_grande.jpg')
GO

INSERT INTO Products (Name, [Description], Price, DiscountedPrice, Sale, SKU, Status, CategoryID, ImageURL)
VALUES (N'Maybelline Son kem superstay vinyl ink', N'Son Kem Bóng Maybelline Super Stay Vinyl Ink với chất kem siêu mỏng, bóng nhẹ nhưng có thể giữ màu đến 16h và hoàn toàn không lem, không trôi. Công thức Color Lock chống lại hiện tượng nhòe và chuyển màu, đồng thời mang lại lớp nền bóng mượt tức thì. Nhóm màu Nude Shock với các tông màu thời thượng và cá tính lấy cảm hứng từ New York.',298000.00, 223500.00, -25, 'BL-00023292', 15, 24, 'https://product.hstatic.net/200000551679/product/maybelline_son_kem_superstay_vinyl_ink_5bb0f56103214cdd8413181be074ae18_grande.jpg'),
       (N'3CE Son thỏi Mood Recipe Matte Lip Color', N'Son thỏi 3CE Mood Recipe Matte Lip Color đã cải tiến tinh tế hơn khi kết hợp kết cấu son lì với dạng kem xôm xốp (creamy) mang lại cảm giác nhẹ môi, không nặng, không vón cục và không bị bột, khắc phục các khuyết điểm dễ gặp của các dòng son lì 3CE mắc phải trước đó.', 380000.00, 304000.00, -20, 'BL-00002278', 12, 24, 'https://product.hstatic.net/200000551679/product/untitled-3-02_039f055cca284e1c9192bcf5c62718fa.png'),
       (N'Some By Mi Son dưỡng chống nắng V10 Hyal Lip Sun Protector 7ml', N'Son dưỡng chống nắng Some By Mi V10 Hyal Lip Sun Protector là sản phẩm son dưỡng chống nắng derma 2 chức năng dưỡng môi và chống nắng.', 218000.00, 148240.00, -32, 'BL-00021479', 21, 24, 'https://product.hstatic.net/200000551679/product/some_by_mi-64_660bba716de04c5d8da74518aefd7901_grande.jpg')
GO

INSERT INTO Products (Name, [Description], Price, DiscountedPrice, Sale, SKU, Status, CategoryID, ImageURL)
VALUES (N'BOM Chì kẻ mày Super Slim Eyebrow', N'Chì kẻ mày BOM Super Slim Eyebrow giúp cho gương mặt thêm phần cuối hút với hàng lông mày tơi mảnh nhưng vẫn đậm màu, ngay cả khi kẻ chồng nhiều lớp.', 228000.00, 228000.00, 0, 'BL-00023788', 14, 25, 'https://product.hstatic.net/200000551679/product/bom-23_fd27359d73274c669bf1eb8c1d39b853_grande.jpg'),
       (N'Nature Republic Bảng phấn mắt Daily Basic Palette', N'Bảng phấn mắt Nature Republic Daily Basic Palette với các gam màu cơ bản thích hợp cho lớp trang điểm hàng ngày của bạn.', 285000.00, 213750.00, -25, 'BL-00018539', 5, 25, 'https://product.hstatic.net/200000551679/product/untitled-1-01__2__bdf1ce4d04b746b38003fa80c2024edb_1024x1024.png'),
       (N'Maybelline Bút kẻ mắt nước siêu sắc mảnh Maybelline New York Hyper Shapp Extreme Liner Black', N'Bút kẻ mắt nước siêu sắc mảnh Maybelline New York Hyper Shapp Extreme Liner Black áp dụng công nghệ Ink Capsule mới giúp dòng mực ra đều hơn 147% và đậm nét hơn so với phiên bản cũ đồng thời giữ đường eyeliner bền màu suốt 36 giờ. Với đầu cọ sắc mảnh 0,01mm giúp bạn linh hoạt tạo ra những đường kẻ như ý.', 228000.00, 180120.00, -21, 'BL-00018943', 29, 25, 'https://product.hstatic.net/200000551679/product/maybelline_25_efa636c4af154e23bb0a8487361f8552_grande.png'),
       (N'Maybelline Chuốt Mi Lash Sensational Sky High 6ml', N'Chuốt mi Maybelline Lash Sensational Sky High giúp hàng mi của bạn cao vút từ mọi góc độ. Mascara dài mi mang lại độ dài hoàn hảo, thích hợp cho mắt nhạy cảm và người đeo kính áp tròng.', 268000.00, 214400.00, -20, 'BL-00019561', 10, 25, 'https://product.hstatic.net/200000551679/product/maybelline_1-27_2fdc6e84c6bb4b46b7e233d5556b356d_grande.png')
GO

INSERT INTO Products (Name, [Description], Price, DiscountedPrice, Sale, SKU, Status, CategoryID, ImageURL)
VALUES (N'Silcot Bông Tẩy Trang Nhật Bản', N'Bông Tẩy Trang Nhật Bản Silcot là bông tẩy trang bán chạy hàng đầu Nhật Bản. Trong suốt 10 năm qua, đây là người bạn đồng hành luôn được phụ nữ Nhật tin tưởng. Với chất liệu và thiết kế đặc biệt, đây chắc chắn là lựa chọn "điểm 10" cho bạn trong việc tẩy trang nói riêng và skincare nói chung.', 42800.00, 37000.00, -14, 'BL-00006241', 102, 26, 'https://product.hstatic.net/200000551679/product/bong_tay_trang_82m_16783dd465a141f2ac9096ae7e761b8f_grande.png'),
       (N'Bông tẩy trang Ola', N'Bông tẩy trang Ola là sản phẩm được bán chạy tại Ba Lan trong nhiều năm liền bởi thành phần 100% cotton tự nhiên, rất mềm, mịn và dai, không gây kích ứng.', 47127.00, 37702.00, -20, 'BL-00013171', 89, 26, 'https://product.hstatic.net/200000551679/product/untitled-5-3_c0e26597af864a69805d8fbe8e03e299_grande.png'),
       (N'Sắc Tím Mi giả ST 5 bộ', N'Tạo vẻ ngoài hoàn hảo tự nhiên', 43500.00, 34800.00, -20, 'BL-00022980', 5, 26, 'https://product.hstatic.net/200000551679/product/sac_tim_mi_gia_st_5_bo_61eebe0d334748269a00dbe2b9ab3e6b_grande.jpg'),
       (N'Flormar Bộ cọ trang điểm Makeup Brush Set', N'Set 4 cọ: cọ đánh má, cọ kem nền, cọ trang điểm mắt, cọ tán phấn mắt', 422182.00, 274418.00, -35, 'BL-00017263', 12, 26, 'https://product.hstatic.net/200000551679/product/1._hinh_thumbnail__2__e85fa99bb62941a5a887272275677421_grande.jpg')
GO

INSERT INTO Products (Name, [Description], Price, DiscountedPrice, Sale, SKU, Status, CategoryID, ImageURL)
VALUES (N'Eucerin Gel rửa mặt Dermatoclean Hyaluron Sensitive Skin Cleansing Gel 200ml', N'Eucerin Gel rửa mặt Dermatoclean Hyaluron Sensitive Skin Cleansing Gel 200ml là sự kết hợp hoàn hảo của hai chức năng đó là tẩy trang và rửa mặt giúp làn da bạn loại bỏ đi lớp bụi bẩn và lớp trang điểm, đồng thời mang lại sự tươi mát, độ ẩm cân bằng cho làn da.', 408000.00, 367200.00, -10, 'BL-00026639', 32, 27, 'https://product.hstatic.net/200000551679/product/eucerin_1-31_22daead520854db4882e3634443e2c38_grande.jpg'),
       (N'Garnier Nước tẩy trang Micellar Cleansing Water Salicylic BHA 125ml', N'Nước tẩy trang Micellar Cleansing Water Salicylic BHA Garnier có lớp Micellar chứa các hạt mixen siêu nhỏ để len lỏi sâu và dễ dàng lấy đi bụi bẩn, dầu thừa, lớp trang điểm và chất bẩn khác mà không cần chà xát mạnh, giúp da sạch hoàn hảo và tươi mát mà không quá khô. Làn da sẽ được làm sạch và tươi mới một cách hoàn hảo.', 99000.00, 59400.00, -40, 'BL-00025398', 31, 27, 'https://product.hstatic.net/200000551679/product/garnier_1-11_ad5f9942a2e74cb6a1f5f7f287210d8d_grande.jpg'),
       (N'Bioderma Nước tẩy trang Sebium H2O 500 ml', N'Nước tẩy trang Bioderma Sébium H2O dành cho da hỗn hợp đến da dầu và có mụn, giúp làm sạch sâu bụi bẩn, dầu thừa và lớp trang điểm trên da. Ngoài ra, Sébium H2O còn có khả năng kháng khuẩn và ngăn bít tắc lỗ chân lông gây mụn. Sản phẩm không cần rửa lại bằng nước.', 525000.00, 395000.00, -25, 'BL-00003505', 12, 27, 'https://product.hstatic.net/200000551679/product/bioderma_nuoc_tay_trang_sebium_h2o_500_ml__1__f9c2fc878acf43f5a0451acf5d3af48d_grande.png'),
       (N'Dầu tẩy trang hoa hồng Cocoon Rose Cleansing Oil 140ml', N'Dầu tẩy trang hoa hồng Cocoon Rose Cleansing Oil giúp làm sạch sâu lớp trang điểm, bụi bẩn và dầu thừa, dưỡng ẩm mà không để lại cảm giác nhờn rít khó chịu.', 180000.00, 162000.00, -10, 'BL-00010664', 19, 27, 'https://product.hstatic.net/200000551679/product/untitled-9-26_7cbb8ced168a428e8c1b16c4cd6fc957_grande.png'),
       (N'Skin1004 Tẩy trang Madagascar Centella Light Cleansing Oil 200ml', N'Dầu Tẩy Trang Skin1004 Madagascar Centella Light Cleansing Oil giúp làm sạch sâu làn da và loại bỏ lớp trang điểm cứng đầu với chiết xuất rau má Madagascar tinh khiết kết hợp cùng 6 loại dầu quý được chắt lọc kỹ lưỡng, mang lại làn da sạch tận sâu lỗ chân lông và mềm mịn ngay tức thì.', 545000.00, 365150.00, -33, 'BL-00008164', 12, 27, 'https://product.hstatic.net/200000551679/product/1-01__12__1ed2485f3c014b3088d91d3002011e31_acbe098824ae44138c38ee1870bf23d5_1024x1024.png'),
       (N'Banila Co Sáp tẩy trang clean it zero cleansing balm 100ml ver 1', N'Sáp tẩy trang Banila Co Clean It Zero Cleansing Balm giúp tẩy sạch lớp trang điểm trên da, sáp tẩy trang được thiết kế có nhiều loại sản phẩm phù hợp với từng loại da khác nhau.', 528000.00, 396000.00, -25, 'BL-00022534', 17, 27, 'https://product.hstatic.net/200000551679/product/untitled-8-01_32a019befb8746f582fd6f63bb9be4b7_grande.png')
GO

INSERT INTO Products (Name, [Description], Price, DiscountedPrice, Sale, SKU, Status, CategoryID, ImageURL)
VALUES (N'Dear, Klairs nước hoa hồng Supple Preparation Unscented Toner 180mL', N'Nước hoa hồng không mùi Klairs Supple Preparation Unscented Toner dưỡng ẩm và mềm da chiết xuất từ thực vật, giúp cân bằng độ pH, tăng cường hiệu quả chăm sóc da. Toner có dạng trong suốt, không màu, lỏng, nhẹ, hơi nhớt, thấm rất nhanh trên da. Giúp loại bỏ bụi bẩn và bã nhờn dư thừa trên da sau khi rửa mặt đồng thời cân bằng độ pH để các bước skincare tiếp theo đạt hiệu quả hơn.', 435000.00, 291450.00, -33, 'BL-00003828', 20, 28, 'https://product.hstatic.net/200000551679/product/dear__klairs_nuoc_hoa_hong_unscented__1__caf581f2f86f40a6974f54145bde691d_1024x1024.png'),
       (N'Nacific Tinh chất Hyal Booster Ampoule 50ml', N'Tinh chất Nacific Hyal Booster Ampoule với sự kết hợp 3 loại Hyaluronic Acid ưu việt cùng chiết xuất hoa phục sinh sẽ mang đến giải pháp chăm sóc da hiệu quả, cho làn da được cấp ẩm tức thì, giữ da căng mướt & đàn hồi. Tinh chất với khả năng thẩm thấu nhanh, mang đến cảm giác ẩm mịn không bết rít trên da.', 448000.00, 224000.00, -50, 'BL-00023275', 15, 28, 'https://product.hstatic.net/200000551679/product/untitled_7cd2c803c9ff487d81c85f6410e89a83_grande.png'),
       ('Cocoon Thạch nghệ Hưng Yên Turmeric gel cream 30ml', N'Thạch nghệ Hưng Yên Cocoon Turmeric Gel Cream với kết cấu mỏng nhẹ, thạch nghệ Hưng Yên mang những dưỡng chất từ củ nghệ, Curcuminoid và Hexylresorcinol thấm nhanh vào da giúp làm sáng, chống oxy hoá và làm mờ vết thâm. Làn da trở nên mịn màng và đều màu trong thấy.', 195000.00, 195000.00, 0, 'BL-00020237', 20, 28, 'https://product.hstatic.net/200000551679/product/z5666150423096_76e023ddafc135f68f5ef99f660a30ed_b69698d33d034acea8964bd8a4616213_1024x1024.jpg'),
       (N'Skinlax Dầu lăn dưỡng mắt môi Under Eye & Lip Oil Rollrer 10ml', N'Dầu lăn dưỡng mắt môi Skinlax Under Eye & Lip Oil Rollrer là thanh lăn dưỡng hoàn toàn từ dầu và tinh dầu thiên nhiên. Lớp dầu dưỡng mát, thơm và bóng mượt sẽ là trợ thủ đắc lực giúp bạn “giải tán” thâm sạm trên mắt môi hiệu quả.', 220000.00, 176000.00, -20, 'BL-00020581', 15, 28, 'https://product.hstatic.net/200000551679/product/untitled-5-02_879061145d394ad1be082aa57af46cc3_grande.png'),
       (N'La Roche-Posay Xịt Khoáng Thermal Spring Water 300ml', N'Xịt khoáng La Roche-Posay Thermal Spring Water Sensitive Skin được sản xuất từ nguồn nước khoáng chứa nhiều khoáng chất cân bằng và giàu các nguyên tố vi lượng sẽ giúp làm dịu mát làn da, cung cấp độ ẩm cần thiết, làm giảm kích ứng và bảo vệ da trước các tác hại của môi trường bên ngoài.', 480000.00, 384000.00, -20, 'BL-00002558', 43, 28, 'https://product.hstatic.net/200000551679/product/untitled-6-05_319b5dd154e248ce8fc01ae252353dfa_grande.png')
GO

INSERT INTO Products (Name, [Description], Price, DiscountedPrice, Sale, SKU, Status, CategoryID, ImageURL)
VALUES ('BNBG Vita Genic', N'Mặt nạ BNBG Vita Genic Jelly Mask chứa dưỡng chất Vitamin dạng gel đậm đặc, hàm lượng lên đến 20.000ppm được chiết xuất từ các trái cây tươi ở hòn đảo Jeju xinh đẹp, cung cấp đủ ẩm cho làn da luôn mềm mịn đầy sức sống.', 22000.00, 19000.00, -14, 'BL-2635610', 50, 29, 'https://product.hstatic.net/200000551679/product/7._mat_na_bnbg_vita_cocktail-05_5a72a03d0ca94badade827a731717f74.png'),
       (N'Dear, Klairs Mặt nạ Freshly Juiced Vitamin E Mask 90ml', N'Mặt Nạ Ngủ Klairs Freshly Juiced Vitamin E Mask là sản phẩm đến đến từ thương hiệu Dear Klairs với thiết kế độc đáo 2 trong 1, vừa là mặt nạ ngủ, vừa là kem dưỡng ẩm. Cung cấp hàm lượng dồi dào Vitamin E và chất chống oxy hóa cho làn da trong suốt cả đêm dài, ngăn ngừa lão hóa và dưỡng sáng da hiệu quả.', 545000.00, 365150.00, -33, 'BL-00006422', 20, 29, 'https://product.hstatic.net/200000551679/product/dear__klairs_mat_na_freshly_juiced_vitamin_e_mask_90ml_0d29ab6b720c4da8a880e3655971bbff_1024x1024.png'),
       (N'Care:nel Mặt nạ ngủ môi Lip Night Mask 5g', N'Mặt nạ ngủ môi Care:nel Lip Night Mask giúp nhẹ nhàng loại bỏ tế bào chết, dưỡng ẩm và cung cấp vitamin cho môi, cải thiện tình trạng môi khô nứt nẻ, mang lại đôi môi căng mọng, ẩm mịn chỉ sau 1 đêm.', 69800.00, 52350.00, -25, 'BL-00019675', 30, 29, 'https://product.hstatic.net/200000551679/product/untitled-9-01_f54eba4f89844b69a109415650be4bb7.png'),
       (N'Avif Mặt nạ dưỡng da vùng mắt Bio Cellulose Under-Eye Patches', N'Mặt nạ dưỡng da vùng mắt Avif Bio Cellulose Under-Eye Patches giúp cấp ẩm, tăng đàn hồi, giảm quầng thâm, làm săn chắc da và cho da tươi trẻ hơn.', 26000.00, 20800.00, -20, 'BL-00011081', 120, 29, 'https://product.hstatic.net/200000551679/product/untitled-5-01__3__fe4f08e8cd5d4baca77123706975f206_grande.png')
GO

INSERT INTO Products (Name, [Description], Price, DiscountedPrice, Sale, SKU, Status, CategoryID, ImageURL)
VALUES (N'Sunplay Tinh chất chống nắng Skin Aqua Tone Up UV Essence Lavender SPF50+/PA++++ 50g + quà', N'Tinh chất chống nắng hiệu chỉnh sắc da Sunplay Skin Aqua Tone Up UV Essence với 3 tác dụng chỉ trong 1 sản phẩm: khả năng chống nắng cực đỉnh (SPF 50+ PA++++), giữ ẩm và dưỡng sáng da tối ưu (Vitamin C & Vitamin B3) và khả năng hiệu chỉnh sắc da, nâng tone da rạng rỡ.', 199000.00, 179100.00, -10, 'BL-00025666', 20, 30, 'https://product.hstatic.net/200000551679/product/sunplay-28_f675d11f7dde442ba4bc5a91b05e4d6f_grande.jpg'),
       (N'Sunplay Kem chống nắng dưỡng thể Skin Aqua UV Body Cooling SPF 50+ PA++++150g', N'Kem chống nắng dưỡng thể Sunplay Skin Aqua UV Body Lotion SPF 50+ PA++++ giúp bảo vệ làn da cơ thể khỏi tác hai của tia UV đồng thời mang lại thêm công dụng dưỡng trắng, làm mát da hiệu quả. Đây là sản phẩm dành riêng cho cơ thể với dung tích lớn giúp bạn tiết kiệm hơn và bảo vệ cũng như dưỡng da hiệu quả nhất.', 219000.00, 197100.00, -10, 'BL-00010281', 12, 30, 'https://product.hstatic.net/200000551679/product/sunplay_kem_chong_nang_duong_the_cooling__1__c6f11bd13f6c4c0cb61bfd0331a7c398_grande.png'),
       (N'Re:cipe Xịt chống nắng Phyto Water Defense Sun Spray SPF50+ PA++++ 50ml', N'Re:cipe Xịt chống nắng Phyto Water Defense Sun Spray SPF50+ PA++++ 50ml với Công nghệ SOLAR CLEAR độc quyền mang tới MÀNG LỌC CHỐNG NẮNG 6 LỚP TRONG SUỐT không nâng tone, BỀN VỮNG TRƯỚC TIA UV, KHÔNG TRÔI TRONG NƯỚC & MỒ HÔI giúp bảo vệ tối ưu cho mặt và toàn thân. Đặc biệt nắp chai có thể cảm biến tia UV - lượng UV càng lớn màu nắp càng đậm.', 198000.00, 128700.00, -35, 'BL-00026148', 25, 30, 'https://product.hstatic.net/200000551679/product/untitled-9-01_0164d821aa554223935fb3df6b0dbb67_grande.jpg')
GO

INSERT INTO Products (Name, [Description], Price, DiscountedPrice, Sale, SKU, Status, CategoryID, ImageURL)
VALUES (N'Skinlax xà phòng Face & Body Natural Soap Turmeric & Honey 100g', N'Skinlax xà phòng Face & Body Natural Soap Turmeric & Honey 100g', 75000.00, 60000.00, -20, 'BL-00020598', 15, 31, 'https://product.hstatic.net/200000551679/product/untitled-5-01_6ea6f537752f4d34996f82bedae435f4_grande.png'),
       (N'Kumano Sữa tắm Reihaku Hatomugi Body Soap 800ml', N'Sữa tắm Kumano Reihaku Hatomugi Body Soap chứa chiết xuất hạt Ý dĩ giúp tăng cường độ ẩm cho da, mang lại một làn da mềm mại, mịn màng sau khi tắm.', 127000.00, 89091.00, -30, 'BL-00015669', 8, 31, 'https://product.hstatic.net/200000551679/product/untitled-1-10_137e31972dd04feb9e465d940276a641_grande.png'),
       (N'Cocoon Tẩy da chết cà phê Đak Lak 600ml', N'Tẩy da chết Cocoon cà phê Đắk Lắk là sản phẩm được tạo từ những hạt cà phê nguyên chất xay nhuyễn, hòa quyện cùng bơ cacao Tiền Giang giúp loại bỏ tế bào chết hiệu quả, làm đều màu da, mang lại năng lượng, giúp da trở nên mềm mại và rạng rỡ.', 325000.00, 325000.00, 0, 'BL-00020239', 8, 31, 'https://product.hstatic.net/200000551679/product/7_8419b9055fe341d49a51b6013f2355f0_1024x1024.png'),
       (N'AquaVera Nước rửa tay Liquid Hand Wash 500ml', N'AquaVera Nước rửa tay Liquid Hand Wash nhờ công thức đặc biệt với thành phần chiết xuất hoàn toàn từ thiên nhiên giúp làm sạch da tay nhưng vẫn giữ được độ ẩm cho da tay bạn trở nên mềm mại, mịn màng và tươi mát sau khi sử dụng. Da tay bạn sẽ được bảo vệ và giữ được hương thơm dịu nhẹ.', 45800.00, 39846.00, -14, 'BL-00007470', 5, 31, 'https://product.hstatic.net/200000551679/product/aquavera-nuoc-rua-tay_c4b239bd7072422682d5acbeab08225c_grande.jpg')
GO

INSERT INTO Customers (CustomerID, Name, Email, Phone, Address, PaymentMethod)
VALUES 
(123345, 'Nguyen Thi A', 'nguyenthi.a@example.com', '0901234567', N'123 Đường ABC, Quận 1, TP. HCM', N'Thẻ tín dụng'),
(345567,'Tran Van B', 'tranvan.b@example.com', '0912345678', N'456 Đường DEF, Quận 2, TP. HCM', N'Tiền mặt'),
(567789,'Le Thi C', 'lethi.c@example.com', '0923456789', N'789 Đường GHI, Quận 3, TP. HCM', N'Thẻ ghi nợ'),
(789910, 'Hoang Van D', 'hoangvan.d@example.com', '0934567890', N'101 Đường JKL, Quận 4, TP. HCM', N'Chuyển khoản ngân hàng'),
(910101, 'Phan Thi E', 'phanthi.e@example.com', '0945678901', N'202 Đường MNO, Quận 5, TP. HCM', N'Ví điện tử')
GO

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, ShippingAddress, OrderStatus)
VALUES (123345, '2024/07/25', 618500.00, N'12 Trần Quang Diệu', N'Giao hàng thành công'),
       (345567, '2024/08/01', 454241.00, N'43 Lò Đúc', N'Đang vận chuyển'),
       (567789, '2024/07/29', 752010.00, N'24 Xã Đàn', N'Giao hàng thành công')
GO

INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price)
VALUES (1, 1, 1, 171000.00),
       (1, 4, 1, 223500.00),
       (1, 3, 1, 224000.00)
GO

INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price)
VALUES (2, 19, 1, 365150.00),
       (2, 34, 1, 89091.00)
GO

INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price)
VALUES (3, 12, 5, 37702.00),
       (3, 16, 1, 59400.00),
       (3, 30, 1, 179100.00),
       (3, 35, 1, 325000.00)
GO

INSERT INTO Payments (OrderID, PaymentMethod, PaymentDate, Amount)
VALUES (1, N'Thẻ tín dụng', '2024/07/25', 618500.00),
       (2, N'Tiền mặt', '2024/08/01', 454241.00),
       (3, N'Thẻ ghi nợ', '2024/07/29', 752010.00)
GO

INSERT INTO DiscountCodes (Code, DiscountPercentage, MaxDiscountAmount, MinOrderAmount, ValidFrom, ValidTo)
VALUES (N'THANG8', 7.00, 88.00, 0.00, 2024/08/01, 2024/08/19),
       ('FRESH', 8.00, 25.00, 0.00, 2024/08/01, 2024/08/19),
       ('VUITET', 10.00, 50.00, 0.00, 2023/01/01, 2023/02/28)
GO

-- hiển thị thông tin từng bảng
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM DiscountCodes

-- tổng tiền của từng đơn
SELECT OrderID, SUM(Price * Quantity) AS Revenue
FROM OrderItems
GROUP BY OrderID
ORDER BY OrderID;

-- hiển thị thông tin đơn hàng của 3 cột
SELECT *
FROM Customers AS C
INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
INNER JOIN OrderItems AS OI ON O.OrderID = OI.OrderID;

-- liệt kê danh sách khách hàng đã mua hàng ở cửa hàng
SELECT Name, Address, Phone FROM Customers;

-- liệt kê dsach sp của shop theo thứ tự giá giảm
SELECT Name, Price FROM Products ORDER BY Price DESC;

-- liệt kê các sp khách An đã mua
SELECT DISTINCT P.Name AS [Nguyen Thi A mua]
FROM Products P
JOIN OrderItems OD ON P.ProductID = OD.ProductID
JOIN Orders O ON OD.OrderID = O.OrderID
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE C.Name = N'Nguyen Thi A';

-- số mặt hàng mà cửa hàng bán
SELECT OrderItems.ProductID, OrderItems.Quantity, Products.Name, COUNT(OrderItems.ProductID) AS TotalProducts
FROM OrderItems
JOIN Products ON OrderItems.ProductID = Products.ProductID
GROUP BY OrderItems.ProductID, OrderItems.Quantity, Products.Name;

-- liệt kê dsach khách hàng theo thứ tự al
SELECT Name FROM Customers ORDER BY Name;

-- liệt kê danh sách sản phẩm của cửa hàng
SELECT Name, [Description], Price FROM Products;

-- tổng doanh thu
SELECT SUM(Products.Price * OrderItems.Quantity) AS TotalRevenue
FROM OrderItems 
JOIN Products ON OrderItems.ProductID = Products.ProductID;

-- hiển thị đơn hàng đã giao
SELECT Orders.OrderID, Customers.Name, Orders.OrderDate, Orders.OrderStatus
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderStatus = 'Giao hàng thành công'; -- Điều kiện lọc theo trạng thái 'giao hàng thành công'

-- hiện thi thông tin sản phảm chăm sóc da
SELECT * FROM 
    Products p
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
WHERE 
    c.CategoryID = 28;
GO

-- hiển thị sp có chữ "kem lót"
SELECT ProductID, Name, Price, DiscountedPrice
FROM Products
WHERE Name LIKE N'%Kem lót%';

-- hiển thị toàn bộ sp của hãng Maybelline
SELECT ProductID, Name, Price, DiscountedPrice
FROM Products
WHERE Name LIKE '%Maybelline%';

-- đơn hàng dc đặt trong 07/2024
SELECT OrderID, CustomerID, OrderDate, TotalAmount
FROM Orders
WHERE OrderDate BETWEEN '2024-07-01' AND '2024-07-31';

-- liệt kê các mã giảm giá còn hợp lệ
SELECT Code, DiscountPercentage, MaxDiscountAmount, MinOrderAmount, ValidFrom, ValidTo
FROM DiscountCodes
WHERE GETDATE() BETWEEN ValidFrom AND ValidTo;

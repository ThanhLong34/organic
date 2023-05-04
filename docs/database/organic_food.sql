-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2023 at 12:51 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `organic_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `featureImageId` int(11) DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `systemAdminId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `featureImageId`, `title`, `description`, `content`, `systemAdminId`) VALUES
(3, '22:20:14 14/03/2023', '21:10:40 19/03/2023', NULL, 197, 'Cách làm măng tây xào tỏi', 'Măng tây là một loại rau được khá nhiều người ưa dùng bởi nguồn dinh dưỡng tuyệt vời từ chúng. Hiện nay, măng tây đang được trồng chủ yếu tại một số tỉnh miền Bắc và Đông Nam Bộ.', '<p>Nguyên liệu cần để nấu món măng tây xào tỏi</p><p>500g măng tây xanh</p><p>2 muỗng canh dầu lạc (dầu đậu phộng)</p><p>4 tép tỏi.</p><p>Các gia vị khác: tiêu, bột ngọt, muối, nước mắm.</p><p>Cách nấu măng tây xào tỏi giòn thơm</p><p>Bước 1: Sơ chế nguyên liệu</p><p>Chọn những ngọn măng tây xanh có phần gốc không bị khô, không có đốm vàng. Măng tây sau khi mua về, rửa sạch, tỉa, cắt bỏ phần bị xơ cứng ở gốc hoặc tước bỏ phần vỏ ngoài rồi nấu. Cắt măng tây thành đoạn dài từ 4cm- 5cm.</p><p>Tỏi đem bóc vỏ, băm nhuyễn.</p><p>Bước 2: Xào măng tây với tỏi sao cho vừa xanh vừa giòn</p><p>Cách đơn giản để xào măng tây với tỏi vừa giòn vừa giữ được độ xanh của măng là cần chọn những búp măng tây non, loại bỏ phần già. Bên cạnh đó, cần xào nhanh và đều tay.</p><p>Bước 3: Măng tây xào tỏi</p><p>Đầu tiên, cần phi thơm tỏi với ít dầu trong chảo nóng. Sau đó, bỏ măng tây đã cắt khúc vào xào đều, nêm nếm gia vị muối, tiêu, bột ngọt, nước mắm cho vừa ăn. Xào đều trong 2 phút rồi bắt chảo xuống, bỏ ra đĩa và thưởng thức. Lưu ý, trong quá trình xào không nên đậy nắp vì măng tây sẽ dễ bị chín nhũn và không giữ được màu xanh.</p><p>Trên đây là công thức nấu món măng tây xào tỏi đơn giản, dễ làm cho bữa cơm gia đình thêm hấp dẫn. Chỉ cần chú ý lựa chọn loại măng tây tươi ngon cùng một vài mẹo xào đơn giản là bạn đã có một món ăn thơm ngon rồi.</p><p>Ngoài măng tây xào tỏi với dầu lạc, bạn có thể dùng dầu oliu, dầu mè để xào. Hoặc xào măng tây với một số nguyên liệu khác như tôm, thịt bò cũng cho những hương vị hấp dẫn riêng.</p><p><img src=\"https://images.unsplash.com/photo-1591189863430-ab87e120f312?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1000&amp;q=80\" alt=\"green vegetable on brown wooden table\"></p><p>Măng tây là một loại rau được khá nhiều người ưa dùng bởi nguồn dinh dưỡng tuyệt vời từ chúng. Hiện nay, măng tây đang được trồng chủ yếu tại một số tỉnh miền Bắc và Đông Nam Bộ. Tuy nhiên, để nói đến độ ngon, cho năng suất cao và hàm lượng dinh dưỡng cao phải kể đến tỉnh Ninh Thuận. Măng tây ở đây chủ yếu là loại măng tây xanh và măng tây tím. Riêng loại măng tây trắng được đánh giá là loại măng tây chứa hàm lượng dinh dưỡng cao nhất trong tất cả các loại măng tây. Tuy nhiên, tại Việt Nam hiện chưa trồng được loại này.</p><p>Ngoài ra, để đảm bảo an toàn cho sức khỏe, bạn nên chọn mua măng tây sạch hoặc măng tây hữu cơ. Các loại măng tây hữu cơ không sử dụng phân bón hóa học, thuốc kích thích tăng trưởng, đảm bảo tốt cho sức khỏe cả gia đình. Mua măng tây xanh hữu cơ Ninh Thuận.</p><p>Hy vọng với bài hướng dẫn này, bạn có thể thực hiện được món măng tây xào tỏi vừa giòn xanh vừa thơm ngon cho bữa ăn thêm dinh dưỡng. Chúc các bạn thực hiện thành công</p>', 17),
(4, '22:24:22 14/03/2023', '21:05:24 19/03/2023', NULL, 198, 'Chả cốm ăn với gì ngon?', 'Bánh giò là một loại bánh được làm từ bột gạo tẻ, nhân bánh làm từ thịt nạc heo cùng mộc nhĩ. Loại bánh này rất phổ biến tại các tỉnh miền Bắc.', '<p><span style=\"color: rgb(53, 53, 53);\">Bánh giò là một loại bánh được làm từ bột gạo tẻ, nhân bánh làm từ thịt nạc heo cùng mộc nhĩ. Loại bánh này rất phổ biến tại các tỉnh miền Bắc. Bánh thường ăn kèm với chả quế, thịt xiên, nem chua, xúc xích hay chả cốm. Vỏ bánh mềm, dẻo, có lớp nhân beo béo, nêm nếm vừa vị, ăn kèm dưa leo, chả quế và chả cốm thì không gì ngon bằng.</span></p><p><img src=\"https://images.unsplash.com/photo-1475855664010-a869729f42c3?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1000&amp;q=80\" alt=\"person holding white ceramic cup\"></p><p><span style=\"color: rgb(53, 53, 53);\">Tùy theo phong cách và khẩu vị mà chủ quán tự cho thêm các loại topping đi kèm. Và ở mỗi quán lại có một vị ngon riêng níu kéo bước chân thực khách. Các bạn ở Hà Nội có thể ăn bánh giò kèm chả cốm tại quán Bánh giò Thụy Khuê; Chợ hôm hay bánh giò Nguyễn Công Trứ. Tại Sài Gòn, bạn có thể tìm mua tại Bánh giò Nem chả Dì Linh, Tiệm giò chả Hồng Phúc,…</span></p><p><span style=\"color: rgb(53, 53, 53);\">Đây là một trong số ít món ăn vặt mặn được nhiều người yêu thích ở cả ba miền đất nước. Món ăn này rất đơn giản, chỉ với vài khuôn đậu chiên nóng giòn, bún lá, thịt luộc, dồi, lòng heo, chả cốm, chấm cùng mắm tôm mằn mặn. Chỉ vậy thôi mà làm say mê không biết bao nhiêu thế hệ. Ở mỗi miền, bún đậu lại có những biến tấu riêng, nhưng để làm nên món bún đậu mắm tôm ngon đúng điệu thì nhất thiết cần có chả cốm.</span></p><p><span style=\"color: rgb(53, 53, 53);\">Không những ăn kèm với bánh giò, bún đậu, chả cốm còn được người Hà Nội dùng làm nguyên liệu ăn cùng các loại xôi như xôi trắng, xôi xéo, xôi gấc. Tại Sài Gòn, kiểu dùng xôi với chả cốm thường không phổ biến và được ít người biết đến. Với các bạn tại Hà Nội, có thể ghé đến hàng xôi bà Thảo- Đường Thành hay xôi Cô Kim tại 25 Lò Đúc để thưởng thức.</span></p>', 17),
(5, '22:24:42 14/03/2023', '21:08:06 19/03/2023', NULL, 199, 'Cốm tươi làm món gì ngon?', 'Dùng cốm tươi làm món gì, cốm tươi có thể chế biến thành nhiều món ăn khác nhau như chả cốm, chè cốm, xôi cốm, bánh cốm, kem cốm…', '<p>Sau đây, chúng ta sẽ cùng tìm hiểu công thức cốm tươi làm món gì ngon với món xôi cốm. Chắc hẳn, với nhiều người xôi cốm đã trở thành món ăn quen thuộc mỗi sáng. Tuy nhiên không phải ai cũng biết cách làm xôi cốm thơm ngon, tròn vị.</p><h2>Nguyên liệu làm xôi cốm:</h2><p>200gr cốm tươi</p><p>100gr hạt sen tươi</p><p>100gr đậu xanh đã cà vỏ</p><p>20gr dừa nạo</p><p>Muối, dầu ăn, đường cát.</p><p>Cách làm</p><p>Bước 1: Hạt sen rửa sạch, ninh cho chín nhừ cùng ¼ muỗng cà phê muối. Sau đó, vớt ra để ráo nước rồi xào hạt sen với một muỗng cà phê đường cho sen có vị hơi ngọt.</p><p>Bước 2: Đậu xanh rửa sạch, hấp chín cùng ¼ muỗng cà phê muối, giã nhuyễn rồi nắm thành nắm tròn to. Dừa nạo ngâm đường trong 30 phút, sau đó vớt ra để ráo nước. Rồi xào lửa nhỏ cho tới khi sợi dừa trong.</p><p>Bước 3: Cốm tươi đem bỏ ra một chiếc chảo hoặc mâm rộng. Nếu dùng cốm khô (cốm đông lạnh) thì cần vẩy một chút nước vào cốm để cốm mềm ra.</p><p>Bước 4: Cắt nắm đậu xanh thành từng lát mỏng rồi trộn với cốm. Tiếp tục trộn hạt sen với đậu xanh và cốm cho đến khi đều.</p><p>Bước 5: Đun nước sôi, cho hỗn hợp vừa trộn vào nồi đồ cho đến khi cốm chín mềm. Đổ xôi ra mâm, trộn thêm 2 muỗng cà phê đường hoặc nhiều hơn, tùy vào khẩu vị mỗi người cho vừa ăn. Xới xôi cốm ra đĩa, rắc dừa nạo lên là có thể ăn ngay.</p><p>Cốm tươi làm món gì- Kem cốm thơm mát</p><p>Kem cốm là một trong những món ăn không thể bỏ qua trong những ngày hè nóng bức. Nguyên liệu để làm kem cốm rất đơn giản và dễ tìm. Khi ăn, kem cốm dẻo mịn, mát lạnh, có vị ngọt, beo béo của sữa tươi và kem tươi, chắc chắn sẽ giúp bạn thỏa mãn cơn nóng.</p><p><img src=\"https://themewar.com/html/organia/demo/assets/images/blog/post.jpg\"></p><h2>Nguyên liệu làm kem cốm:</h2><p>250ml kem tươi</p><p>250ml sữa tươi</p><p>100gr đường</p><p>50gr cốm tươi</p><p>50gr cơm dừa tươi</p><p>5-7 lá dứa</p><p>1 lòng đỏ trứng gà</p><p>½ muỗng cà phê muối</p><p>Cách làm</p><p>Bước 1: Đun sữa tươi với 2 muỗng đường và 5gr muối cho đến khi sôi.</p><p>Bước 2: Trộn cốm vào sữa nóng, ngâm cho mềm. Sau đó, đem xay hạt cốm và cơm dừa non. Rồi đem hỗn hợp này để nguội.</p><p>Bước 3: Đánh bông lòng đỏ trứng với đường. Rồi trộn hỗn hợp này với cốm sữa dừa đã xay trước đó. Sau đó đem hỗn hợp này đun sôi nhẹ.</p><p>Bước 4: Thái nhỏ lá nếp, đem xay rồi lọc lấy nước cốt. Đổ nước cốt lá nếp vào hỗn hợp kem đang đun. Vừa đun, vừa khuấy đều để không bị cháy.</p><p>Bước 5: Đánh bông nhẹ kem tươi, trộn cùng hỗn hợp kem đang đun. Để nguội hỗn hợp rồi đổ vào khuôn, đem đông lạnh ở ngăn đá tủ lạnh.</p>', 17),
(9, '20:52:50 19/03/2023', '21:07:58 19/03/2023', NULL, 288, 'Nấm vân chi có tác dụng gì?', 'Cách đây hơn 2000 năm, nấm vân chi rừng đã được biết đến và sử dụng tại Trung Quốc. Giờ đây, khi khoa học phát triển thì công dụng của nấm vân chi rừng ngày càng được khẳng định và nhiều người biết tới.', '<p>Có bao nhiêu loại nấm vân chi rừng?</p><p>Nấm vân chi là loại nấm dược liệu quan trọng, được nghiên cứu có tác dụng tốt với sức khỏe con người. Đặc biệt, nấm vân chi rừng mọc trong tự nhiên còn có nhiều dưỡng chất có lợi hơn nữa.</p><p>3 loại nấm vân chi rừng phổ biến hiện nay</p><p><img src=\"https://images.unsplash.com/photo-1550824730-05ededc35e7a?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1000&amp;q=80\" alt=\"white mushroom bloom during daytime close-up photo\"></p><p>Các loại nấm vân chi rừng:</p><p>Nấm vân chi đỏ: Loại nấm vân chi rừng này có màu sắc đặc trưng là màu đỏ, mũ nấm không quá dày, từ 0,1 – 0,3cm và không hề có cuống. Loại nấm vân chi rừng đỏ có kích thước từ 1 – 8cm.</p><p>Nấm vân chi xanh: Vốn gọi là nấm vân chi rừng xanh bởi nó có màu xanh nổi bật. Mọc phổ biến ở Úc và thường mọc trên các thân cây gỗ mục nát. Trong số các loại nấm vân chi rừng, nấm vân chi xanh thường được sử dụng để trang trí thay vì để ăn.</p><p>Nấm vân chi Coriolus versicolor: Nấm vân chi rừng Coriolus versicolor có màu trắng – nâu – cam. Chúng mọc ở nhiều nơi trên thế giới, trên các loại cây gỗ mục và thường mọc thành chùm giống như một chiếc đuôi gà tây. Từ lâu, loại nấm vân chi rừng này đã được Nhật Bản sử dụng như một liệu pháp hỗ trợ điều trị ung thư.</p><p>Những loại nấm vân chi rừng này phân bổ ở nhiều nơi trên thế giới. Tuy nhiên, số lượng khá ít. Còn ở Việt Nam hiện tại chỉ trồng được chứ không có nấm vân chi rừng.</p><p>Tác dụng của nấm vân chi rừng và lưu ý khi sử dụng</p><p>Nấm vân chi có tác dụng rất tốt đối với sức khỏe con người, cụ thể như sau:</p><p>Loại bỏ khối u ác tính mà không ảnh hưởng đến các tế bào khác</p><p>Trong các cuộc nghiên cứu độc tính chung của nấm vân chi cho thấy cấp tính, bán cấp, mạn tính, subchronic, di truyền, kiểm tra độc tính sinh sản và thai nhi đều âm tính, tức là không hề có tác dụng phụ.</p><p>Nấm vân chi có tác dụng chọn lọc gây độc tế bào trên tế bào ung thư mà không gây ảnh hưởng đến các tế bào bình thường khác.</p><p>Giúp sản sinh phản ứng sinh học sửa đổi có lợi trong điều trị ung thư</p><p>Nấm vân chi được biết đến với nhiều công dụng hữu hiệu trong hỗ trợ và điều trị ung thư.</p><p>Nấm vân chi giúp sản sinh ra interferon a,b bởi các tế bào máu trắng bạch cầu đơn nhân. Đồng thời, kích hoạt các hoạt động của tế bào chống ung thư, tăng sự tổng hợp của các yếu tố miễn dịch, ngăn chặn sự teo tuyến của các loại thuốc hóa trị liệu. Giúp cơ thể phục hồi nhanh những thiệt hại của tế bào tạo máu.</p><p>Gia tăng đáng kể chất lượng cuộc sống của bệnh nhân</p><p>Các kết quả thử nghiệm lâm sàng cho thấy, nấm vân chi rừng với các liệu pháp hóa trị và xạ trị có thể cải thiện đáng kể triệu chứng lâm sàng của bệnh nhân, đặc biệt là bệnh nhân ung thư.</p><p>Sử dụng nấm vân chi còn tăng sức đề kháng, bảo vệ máu, mang đến sức mạnh và ổn định chức năng miễn dịch của bệnh nhân. Từ đó giúp nâng cao chất lượng cuộc sống.</p><p>Giải độc những tác hại của hóa trị và xạ trị</p><p>Cách điều trị hiện nay của các bệnh nhân ung thư là hóa trị và xạ trị. Tuy nhiên, hai cách này đều gây những ảnh hưởng không tốt cho cơ thể. Sử dụng nấm vân chi rừng giúp giảm các phản ứng bất lợi gây ra bởi hóa trị và xạ trị.</p><p>Cải thiện sự ngon miệng của bệnh nhân ung thư</p><p>Khoảng 40 – 50% bệnh nhân ung thư gặp phải tình trạng chán ăn. Nghiên cứu lâm sàng cho thấy, nấm vân chi có thể tăng cảm giác ngon miệng. Qua đó, giúp bổ sung chất dinh dưỡng và gia tăng hiệu quả điều trị cho bệnh nhân.</p><p><img src=\"https://images.unsplash.com/photo-1512595765784-5ebad80772a3?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1000&amp;q=80\" alt=\"flat lay photography of mushrooms\"></p><p>Nấm vân chi rừng có tác dụng với sức khỏe nói chung và bệnh nhân ung thư nói riêng. Tuy nhiên, nấm vân chi rừng hiện nay khá ít và chưa có ở Việt Nam mà chỉ có những loại nấm được nuôi trồng. Vì thế, khi mua hàng bạn nên cẩn thận để không mua phải nấm vân chi rừng giả. Điều này, không những không cải thiện tình trạng sức khỏe mà còn “rước họa vào thân”. Tốt nhất, bạn nên tìm đến những địa chỉ bán nấm vân chi đáng tin cậy.</p>', 17),
(10, '20:56:33 19/03/2023', '21:08:13 19/03/2023', NULL, 289, 'Súp lơ xanh nấu với món gì ngon?', 'Súp lơ xanh nấu với món gì ngon? Súp lơ xanh xào gà', '<p>Súp lơ xanh xào gà</p><p><img src=\"https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1000&amp;q=80\" alt=\"vegetable and meat on bowl\"></p><p>Nguyên liệu:</p><p>600g ức gà; 250g súp lơ xanh; ½ muỗng cà phê vừng đã rang chín; dầu mè; dầu oliu; bột ngô; hành tây; gừng; mật ong; và các gia vị khác như hành, tiêu, hạt nêm.</p><p>Thực hiện:</p><p>Bước 1: Ức gà rửa sạch, cắt miếng nhỏ vừa ăn. Hành tây rửa sạch, cắt khúc nhỏ. Súp lơ xanh sau khi rửa sạch, cắt khúc từ 4cm- 5cm. Gừng bỏ vỏ ngoài, cắt thành sợi nhỏ, mỏng.</p><p>Bước 2: Trộn nước tương, mật ong, dầu mè, bột ngô tùy theo khẩu vị mỗi người. Đánh đều hỗn hợp cho đến khi sánh mịn.</p><p>Bước 3: Cho dầu oliu vào chảo, khi chảo nóng bắt đầu cho ức gà vào xào cho săn. Sau đó cho hành tây, gừng cắt sợi, súp lơ xanh và chút tiêu vào xào đều trong 4 phút. Tiếp đó vặn lửa nhỏ và thêm hỗn hợp nước sốt đã làm trước đó vào chảo và đảo đều. Nấu thêm 5 phút cho đến khi nước sốt có độ sền sệt.</p><p>Bước 4: Tắt bếp, cho món ăn ra đĩa và rắc hạt vừng đã rang lên trên. Dùng nóng với cơm gạo lứt sẽ cho vị ngon hơn.</p><p>Súp lơ xanh nấu món gì ngon? Bạn có thể xào loại rau này với nhiều nguyên liệu khác như tôm, thịt bò, tỏi…đều cho những hương vị tươi ngon.</p><p>Mì spaghetti với súp lơ xanh</p><p>Một món ăn với súp lơ xanh nấu món gì ngon mà các bạn có thể tham khảo là mì spaghetti với súp lơ xanh. Món ăn được dùng phổ biến tại nhiều nước Châu Âu bởi hương vị thơm ngon lại chứa đầy đủ dinh dưỡng.</p><p>Nguyên liệu:</p><p>50g mì spaghetti; 200g súp lơ xanh; 50g rau cải bó xôi (rau chân vịt); 2 quả cà chua; dầu oliu; hành, tỏi băm nhuyễn; các gia vị khác như sốt cà chua, tiêu, hạt nêm.</p><p>Thực hiện:</p><p>Bước 1: Súp lơ xanh rửa sạch, cắt khúc vừa ăn. Cải bó xôi rửa sạch, cắt khúc từ 3cm- 4cm. Cà chua sau khi rửa sạch, cắt hạt lựu.</p><p>Bước 2: Chần súp lơ xanh trong nước sôi trong 2 phút, vớt ra, bỏ vào tô nước đá lạnh. Bắt nồi nước sôi, cho mì spaghetti vào nấu trong 9 phút, sau đó vớt ra cho ráo nước.</p><p>Bước 3: Bắt chảo, cho dầu oliu vào chảo. Khi chảo nóng, cho hành, tỏi băm nhuyễn vào xào cho thơm, sau đó cho cà chua vào xào cho mềm. Cho tiếp rau cải bó xôi, súp lơ xanh vào xào, thêm 2 muỗng sốt cà chua và nêm nếm gia vị cho vừa ăn. Cuối cùng, thêm mì spaghetti vào đảo đều.</p><p>Bước 4: Tắt bếp, cho thức ăn ra đĩa. Dùng khi mì còn nóng.</p><p><img src=\"https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1000&amp;q=80\" alt=\"cooked dish on gray bowl\"></p><p>Lưu ý:</p><p>Có rất nhiều công thức cho súp lơ xanh nấu món gì ngon đơn giản mà bạn có thể thực hiện. Riêng với món mì spaghetti, bạn có thể thêm nhiều loại rau củ khác hoặc chế biến với nước sốt kem tươi cho vị cũng rất ngon.</p><p>Súp lơ xanh có thể ăn được tất cả kể cả phần thân. Những phần có lớp thân già, cứng, bạn có thể gọt bỏ lớp vỏ ngoài, phần thân mềm bên trong thường rất giòn và ngọt, hoàn toàn có thể sử dụng.</p><p>Khi nấu các món với súp lơ xanh, nên dùng nóng để giữ được các chất dinh dưỡng và hương vị thơm ngon.</p>', 17),
(11, '21:01:21 19/03/2023', '21:06:04 19/03/2023', NULL, 290, 'Yến mạch là gì?', 'Yến mạch là một loại ngũ cốc, thường được trồng ở những vùng khí hậu ôn đới mát mẻ.', '<h2>Yến mạch là gì?</h2><p>Yến mạch là một loại ngũ cốc, thường được trồng ở những vùng khí hậu ôn đới mát mẻ. Cây khi thu hoạch thường đạt chiều cao 1,5m. Yến mạch có một số đặc điểm khá giống với lúa mạch nhưng chúng chỉ có thể phát triển trên đất có nhiều cát, độ phì nhiêu thấp và có tính axit cao. So với các loại ngũ cốc khác, yến mạch không chứa gluten, ít tinh bột, giàu chất xơ, các loại vitamin và khoáng chất. Thích hợp dùng cho cả người lớn và bé ăn dặm.</p><p>Yến mạch khi ăn có mùi thơm nhẹ, vị hơi ngọt. Thường được dùng làm thực phẩm chế biến thức ăn, nguyên liệu làm đẹp và giảm cân. Yến mạch sau khi thu hoạch được sơ chế thành 4 loại. Khi bạn chưa nắm rõ yến mạch là gì hay có bao nhiêu loại yến mạch thì đây sẽ là câu trả lời thỏa đáng.</p><p><img src=\"https://images.unsplash.com/photo-1571748982800-fa51082c2224?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1000&amp;q=80\" alt=\"nuts and bowl of cereals\"></p><h2>Phân biệt các dạng yến mạch</h2><p>Yến mạch sau khi thu hoạch được chế biến thành nhiều dạng khác nhau tùy theo nhu cầu sử dụng của người dùng. Khi đã có những thông tin về yến mạch là gì thì bạn cũng cần phải biết có bao nhiêu dạng yến mạch.</p><h2>Yến mạch nguyên hạt</h2><p>Như khi thu hoạch lúa nếp tại Việt Nam, yến mạch sau khi thu hoạch sẽ được tuốt bỏ lớp vỏ bên ngoài là có thể dùng. Tuy nhiên, yến mạch nguyên hạt có thời gian chín khá lâu (50 phút) và muốn yến mạch chín đều, không bị dai thì nên nấu với tỷ lệ nước và yến mạch là 3: 1.</p><h2>Yến mạch cắt nhỏ</h2><p>Loại này được cắt nhỏ từ hạt yến mạch nguyên hạt. Giúp tiết kiệm thời gian nấu, bạn chỉ cần 30 phút là có thể dùng được. Yến mạch chứa lượng lớn chất xơ, chất chống oxy hóa. Vì vậy, chúng đặc biệt thích hợp cho những người bị táo bón kéo dài hay những người bị tiểu đường.</p><h2>Yến mạch cán dẹt</h2><p>Loại yến mạch này được làm từ hạt yến mạch nguyên hạt đã hấp chín, sau đó đem cán dẹt. Tuy nhiên, khi chế biến làm món ăn, bạn vẫn cần phải nấu chín chúng trong 15 phút để dễ ăn hơn.</p><p>Tại các nước phương Tây, yến mạch rất được ưa chuộng, được dùng làm thực phẩm cho cả bữa sáng và tối. Yến mạch là nguồn thực phẩm cực kì lành mạnh và bổ dưỡng cho cơ thể. Tại nước ta, yến mạch chủ yếu được nhập khẩu từ các nước như Mỹ, Úc, Pháp,… Tuy nhiên, chúng còn ít phổ biến tại nước ta nên nhiều người thường phân vân không biết yến mạch là gì.</p>', 17);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `message` text NOT NULL,
  `replyMessage` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `fullname`, `email`, `subject`, `message`, `replyMessage`, `status`) VALUES
(1, '09:38:50 17/03/2023', '09:10:16 18/03/2023', NULL, 'Nguyễn Thị Huế', '2014468@dlu.edu.vn', 'Hoàn tiền sản phẩm', 'Làm sao tôi có thể hoàn tiền sản phẩm mua nhầm?', 'Bạn có thể thương lượng với chúng tôi', 1),
(2, '09:40:19 17/03/2023', '17:39:43 04/05/2023', NULL, 'Dương Mỹ Lộc', '2014468@dlu.edu.vn', 'Đổi sản phẩm', 'Làm sao tôi có thể đổi sản phẩm?', 'Bạn có thể liên hệ với chúng tôi', 1),
(3, '10:22:53 17/03/2023', '10:26:43 17/03/2023', NULL, 'Nguyễn Việt Hoàng', '2014468@dlu.edu.vn', 'Thời gian nhận hàng', 'Shop thường gửi hàng tới nơi lúc nào?', NULL, 0),
(4, '10:23:48 17/03/2023', '09:11:46 18/03/2023', NULL, 'Phạm Thanh Sơn', '2014468@dlu.edu.vn', 'Có duyệt đơn hàng không', 'Shop có duyệt đơn hàng trước khi giao không?', 'Có nha bạn', 1),
(5, '10:35:52 17/03/2023', NULL, NULL, 'Tesgin 1', '2014468@dlu.edu.vn', 'Có duyệt đơn hàng không', 'Shop có duyệt đơn hàng trước khi giao không?', NULL, 0),
(6, '10:35:56 17/03/2023', '10:36:56 17/03/2023', NULL, 'Tesgin 2', '2014468@dlu.edu.vn', 'Có duyệt đơn hàng không', 'Shop có duyệt đơn hàng trước khi giao không?', NULL, 0),
(7, '10:36:01 17/03/2023', '21:59:01 17/03/2023', NULL, 'Tesgin 3', '2014468@dlu.edu.vn', 'Có duyệt đơn hàng không', 'Shop có duyệt đơn hàng trước khi giao không?', NULL, 0),
(8, '10:16:53 21/03/2023', NULL, NULL, 'Thành Long', 'thanhlongedu0304@gmail.com', 'Chất lượng sản phẩm', 'Chất lượng sản phẩm tốt, đóng gói cẩn thận', NULL, 0),
(17, '16:05:51 04/05/2023', NULL, NULL, 'Nguyễn Thành Long', 'thanhlongedu0304@gmail.com', 'Sản phẩm tốt', 'Sản phẩm tốt, giao hàng đúng hẹn, website đẹp', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `couponcode`
--

CREATE TABLE `couponcode` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `isLimited` tinyint(1) NOT NULL DEFAULT 0,
  `percentValue` int(11) DEFAULT 0,
  `remainingQuantityApplied` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `couponcode`
--

INSERT INTO `couponcode` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `code`, `description`, `isLimited`, `percentValue`, `remainingQuantityApplied`) VALUES
(1, '13:39:52 17/03/2023', NULL, NULL, 'wtCrhTjWZdKC', 'Dành cho khách hàng đăng ký', 0, 20, 0),
(2, '13:49:17 17/03/2023', NULL, NULL, 'yjGVkVoSeco7', 'Ưu đãi 30/4', 1, 15, 0),
(3, '13:52:09 17/03/2023', '18:38:55 18/03/2023', NULL, 'HdrkmxeYxKIB', 'Ưu đãi 1/5', 1, 20, 6);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `size` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `link`, `filename`, `size`) VALUES
(18, '21:13:02 06/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6405f4ee67a37.jpg', 'project_image6405f4ee67a37.jpg', 7662),
(26, '10:10:06 11/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image640bf10e41356.jpg', 'project_image640bf10e41356.jpg', 26476),
(28, '15:01:59 12/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image640d86f7b8e5b.jpg', 'project_image640d86f7b8e5b.jpg', 7662),
(126, '14:36:38 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64102406c72a2.png', 'project_image64102406c72a2.png', 47416),
(127, '14:36:58 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6410241a5b2aa.png', 'project_image6410241a5b2aa.png', 13416),
(128, '14:37:20 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64102430619d9.png', 'project_image64102430619d9.png', 14888),
(129, '14:43:57 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641025bda1e04.png', 'project_image641025bda1e04.png', 38067),
(130, '14:45:00 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641025fcb5903.png', 'project_image641025fcb5903.png', 42383),
(131, '14:47:33 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64102695a0782.png', 'project_image64102695a0782.png', 72083),
(132, '14:49:35 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6410270f66330.png', 'project_image6410270f66330.png', 58229),
(133, '14:55:35 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64102877b161b.png', 'project_image64102877b161b.png', 34717),
(134, '14:56:20 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641028a41d12a.png', 'project_image641028a41d12a.png', 31169),
(144, '16:04:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6410388936975.png', 'project_image6410388936975.png', 52020),
(145, '16:04:12 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6410388c35fa8.png', 'project_image6410388c35fa8.png', 52020),
(146, '16:04:14 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6410388e7831a.jpg', 'project_image6410388e7831a.jpg', 82600),
(147, '16:04:16 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103890a5ec5.jpg', 'project_image64103890a5ec5.jpg', 218814),
(148, '16:05:06 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641038c2b9034.png', 'project_image641038c2b9034.png', 97796),
(149, '16:05:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641038c55b79e.png', 'project_image641038c55b79e.png', 97796),
(150, '16:05:11 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641038c7080c2.jpg', 'project_image641038c7080c2.jpg', 82600),
(157, '16:19:05 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103c090ef22.png', 'project_image64103c090ef22.png', 95033),
(158, '16:19:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103c0d3669a.png', 'project_image64103c0d3669a.png', 95033),
(159, '16:19:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103c0d39059.jpg', 'project_image64103c0d39059.jpg', 82600),
(160, '16:19:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103c0d3923e.jpg', 'project_image64103c0d3923e.jpg', 218814),
(165, '16:21:45 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ca92305b.png', 'project_image64103ca92305b.png', 131565),
(166, '16:21:58 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103cb655c1c.png', 'project_image64103cb655c1c.png', 131565),
(167, '16:22:02 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103cba8074e.jpg', 'project_image64103cba8074e.jpg', 218814),
(168, '16:23:18 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d06e6474.png', 'project_image64103d06e6474.png', 177127),
(169, '16:23:25 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d0d83db9.jpg', 'project_image64103d0d83db9.jpg', 82600),
(170, '16:23:25 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d0d83db5.png', 'project_image64103d0d83db5.png', 177127),
(171, '16:24:06 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d361b4ec.png', 'project_image64103d361b4ec.png', 199249),
(172, '16:24:11 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d3bbfac7.png', 'project_image64103d3bbfac7.png', 199249),
(173, '16:24:15 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d3f086e3.jpg', 'project_image64103d3f086e3.jpg', 82600),
(174, '16:25:40 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d94c785b.png', 'project_image64103d94c785b.png', 110896),
(175, '16:25:44 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d980b86d.png', 'project_image64103d980b86d.png', 110896),
(176, '16:25:45 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d99bec9a.jpg', 'project_image64103d99bec9a.jpg', 218814),
(177, '16:26:25 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103dc1932f4.png', 'project_image64103dc1932f4.png', 111711),
(178, '16:26:52 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ddc8094b.png', 'project_image64103ddc8094b.png', 111711),
(179, '16:26:52 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ddc810ad.jpg', 'project_image64103ddc810ad.jpg', 82600),
(180, '16:28:39 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e47bb96f.png', 'project_image64103e47bb96f.png', 103649),
(181, '16:28:43 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e4bef8fa.png', 'project_image64103e4bef8fa.png', 103649),
(182, '16:28:43 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e4beffb9.jpg', 'project_image64103e4beffb9.jpg', 82600),
(183, '16:29:36 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e8038cd1.png', 'project_image64103e8038cd1.png', 114609),
(184, '16:29:40 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e84830f6.png', 'project_image64103e84830f6.png', 114609),
(185, '16:29:40 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e8485116.jpg', 'project_image64103e8485116.jpg', 218814),
(186, '16:30:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ea1d4834.png', 'project_image64103ea1d4834.png', 89306),
(187, '16:30:38 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ebe01624.png', 'project_image64103ebe01624.png', 89306),
(188, '16:30:40 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ec037d3f.jpg', 'project_image64103ec037d3f.jpg', 218814),
(197, '22:19:47 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64109093e2bca.jpg', 'project_image64109093e2bca.jpg', 206436),
(198, '22:24:16 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641091a0433b4.jpg', 'project_image641091a0433b4.jpg', 297970),
(199, '22:24:40 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641091b80a830.jpg', 'project_image641091b80a830.jpg', 212053),
(224, '18:15:17 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416eec5762a8.png', 'project_image6416eec5762a8.png', 280202),
(225, '18:15:21 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416eec918b57.png', 'project_image6416eec918b57.png', 280202),
(226, '18:15:26 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416eece36e17.jpg', 'project_image6416eece36e17.jpg', 82600),
(227, '18:19:32 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416efc4e4e8a.png', 'project_image6416efc4e4e8a.png', 209154),
(228, '18:19:38 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416efca46633.png', 'project_image6416efca46633.png', 209154),
(229, '18:19:38 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416efca473e0.jpg', 'project_image6416efca473e0.jpg', 82600),
(230, '18:21:48 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f04cbebbf.png', 'project_image6416f04cbebbf.png', 180462),
(231, '18:21:53 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f051c7ddb.png', 'project_image6416f051c7ddb.png', 180462),
(232, '18:21:53 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f051c91d0.jpg', 'project_image6416f051c91d0.jpg', 82600),
(233, '18:27:30 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f1a2c1e7d.png', 'project_image6416f1a2c1e7d.png', 241090),
(234, '18:27:35 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f1a79b4d3.png', 'project_image6416f1a79b4d3.png', 241090),
(235, '18:27:35 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f1a79cbcd.jpg', 'project_image6416f1a79cbcd.jpg', 82600),
(236, '18:29:09 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f20598e25.png', 'project_image6416f20598e25.png', 188815),
(237, '18:29:41 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f225320d1.jpg', 'project_image6416f225320d1.jpg', 82600),
(238, '18:29:41 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f22532260.png', 'project_image6416f22532260.png', 188815),
(239, '18:30:48 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f2683c3a0.png', 'project_image6416f2683c3a0.png', 188897),
(240, '18:30:53 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f26d09bb4.png', 'project_image6416f26d09bb4.png', 188897),
(241, '18:30:53 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f26d0c06f.jpg', 'project_image6416f26d0c06f.jpg', 82600),
(242, '18:34:04 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f32c41c1e.png', 'project_image6416f32c41c1e.png', 89022),
(243, '18:34:10 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f332307c6.png', 'project_image6416f332307c6.png', 89022),
(244, '18:34:10 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f33232809.jpg', 'project_image6416f33232809.jpg', 82600),
(245, '18:35:00 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f36461098.png', 'project_image6416f36461098.png', 124942),
(246, '18:36:01 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f3a172cda.png', 'project_image6416f3a172cda.png', 124942),
(247, '18:36:01 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f3a172c89.jpg', 'project_image6416f3a172c89.jpg', 218814),
(248, '18:39:10 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f45e8bfb1.png', 'project_image6416f45e8bfb1.png', 158027),
(249, '18:39:15 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f463af6d9.png', 'project_image6416f463af6d9.png', 158027),
(250, '18:39:15 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f463af6d9.jpg', 'project_image6416f463af6d9.jpg', 218814),
(251, '18:40:38 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f4b6f0076.png', 'project_image6416f4b6f0076.png', 161903),
(252, '18:40:50 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416f4c2f0f02.png', 'project_image6416f4c2f0f02.png', 161903),
(254, '19:21:20 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416fe4090d19.png', 'project_image6416fe4090d19.png', 191105),
(255, '19:22:13 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416fe75ee75d.jpg', 'project_image6416fe75ee75d.jpg', 218814),
(256, '19:22:13 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416fe75f2340.png', 'project_image6416fe75f2340.png', 191105),
(257, '19:23:09 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416feadc7999.png', 'project_image6416feadc7999.png', 214086),
(258, '19:23:16 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416feb43d3ce.jpg', 'project_image6416feb43d3ce.jpg', 218814),
(259, '19:23:16 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416feb4405b7.png', 'project_image6416feb4405b7.png', 214086),
(260, '19:24:31 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416feff12f72.png', 'project_image6416feff12f72.png', 184747),
(261, '19:24:39 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416ff0730c79.png', 'project_image6416ff0730c79.png', 184747),
(262, '19:24:39 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6416ff0731861.jpg', 'project_image6416ff0731861.jpg', 218814),
(263, '19:31:40 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641700ac0bb8c.png', 'project_image641700ac0bb8c.png', 315046),
(264, '19:31:49 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641700b5bdde6.jpg', 'project_image641700b5bdde6.jpg', 218814),
(265, '19:31:49 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641700b5bdf54.png', 'project_image641700b5bdf54.png', 315046),
(266, '19:42:21 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6417032d15b04.png', 'project_image6417032d15b04.png', 88618),
(267, '19:43:36 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641703781395c.jpg', 'project_image641703781395c.jpg', 81371),
(268, '19:43:36 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6417037814bc4.png', 'project_image6417037814bc4.png', 88618),
(269, '19:44:08 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6417039865e05.png', 'project_image6417039865e05.png', 256483),
(270, '19:44:43 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641703bba19e7.jpg', 'project_image641703bba19e7.jpg', 227875),
(271, '19:44:43 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641703bba3385.png', 'project_image641703bba3385.png', 256483),
(272, '19:53:07 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641705b3201ca.png', 'project_image641705b3201ca.png', 208369),
(273, '19:53:10 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641705b6a00d9.png', 'project_image641705b6a00d9.png', 208369),
(274, '19:54:14 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641705f619263.png', 'project_image641705f619263.png', 221526),
(275, '19:54:22 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641705fe80f28.png', 'project_image641705fe80f28.png', 221526),
(276, '20:24:28 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170d0c3627e.png', 'project_image64170d0c3627e.png', 127443),
(277, '20:24:33 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170d117f104.jpg', 'project_image64170d117f104.jpg', 109808),
(278, '20:24:33 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170d118269b.png', 'project_image64170d118269b.png', 127443),
(279, '20:27:32 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170dc4a418f.png', 'project_image64170dc4a418f.png', 157120),
(280, '20:27:39 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170dcb213df.jpg', 'project_image64170dcb213df.jpg', 144290),
(281, '20:27:39 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170dcb21f53.png', 'project_image64170dcb21f53.png', 157120),
(282, '20:28:45 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170e0d21003.png', 'project_image64170e0d21003.png', 151829),
(283, '20:28:53 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170e152f9b6.jpg', 'project_image64170e152f9b6.jpg', 137953),
(284, '20:28:53 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170e15334a7.png', 'project_image64170e15334a7.png', 151829),
(285, '20:30:01 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170e59e4d5d.png', 'project_image64170e59e4d5d.png', 233628),
(286, '20:30:07 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170e5f2bd2c.png', 'project_image64170e5f2bd2c.png', 233628),
(287, '20:30:07 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64170e5f2bd2c.jpg', 'project_image64170e5f2bd2c.jpg', 203199),
(288, '20:52:45 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641713ad89ddc.jpg', 'project_image641713ad89ddc.jpg', 188690),
(289, '20:53:46 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641713ea86785.jpg', 'project_image641713ea86785.jpg', 76208),
(290, '20:58:35 19/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6417150b713a0.jpg', 'project_image6417150b713a0.jpg', 94231),
(291, '18:23:42 20/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6418423e70140.png', 'project_image6418423e70140.png', 221463),
(292, '18:23:45 20/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64184241ef6b4.png', 'project_image64184241ef6b4.png', 221463),
(293, '18:24:58 20/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6418428a3cc3e.png', 'project_image6418428a3cc3e.png', 156503),
(294, '18:25:01 20/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6418428d09d17.png', 'project_image6418428d09d17.png', 156503),
(295, '18:25:41 20/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641842b519a21.png', 'project_image641842b519a21.png', 261685),
(296, '18:25:43 20/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641842b77deff.png', 'project_image641842b77deff.png', 261685),
(297, '18:26:41 20/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641842f1dba80.png', 'project_image641842f1dba80.png', 173355),
(298, '18:26:44 20/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641842f4e3bb0.png', 'project_image641842f4e3bb0.png', 173355);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `streetAddress` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `couponCodeId` int(11) DEFAULT NULL,
  `deliveryCost` int(11) DEFAULT 0,
  `totalCost` int(11) DEFAULT 0,
  `paymentCost` int(11) DEFAULT 0,
  `orderStatusId` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `fullname`, `streetAddress`, `city`, `phone`, `email`, `notes`, `couponCodeId`, `deliveryCost`, `totalCost`, `paymentCost`, `orderStatusId`) VALUES
(26, '14:30:24 22/03/2023', '15:04:12 22/03/2023', NULL, 'Nguyễn Thành Long', '24 Vạn Xuân', 'TT Lạc Dương - Tỉnh Lâm Đồng', '0353292241', 'thanhlongedu0304@gmail.com', 'Shop giao hàng vào thứ 7 tuần này nhé', 1, 0, 3808000, 3046400, 4),
(27, '14:34:25 22/03/2023', '15:04:08 22/03/2023', NULL, 'Thành Long', 'Abc test', 'Đà Lạt', '0353292241', '2014468@dlu.edu.vn', '', 2, 0, 382000, 324700, 4),
(28, '14:36:56 22/03/2023', '15:04:05 22/03/2023', NULL, 'Bot Bot', '123 Nguyễn Văn Trỗi', 'Hà Nội', '0123456788', 'nguyenlong0304tester1@gmail.com', '', 2, 0, 1737000, 1476450, 4),
(29, '14:39:52 22/03/2023', '15:03:59 22/03/2023', NULL, 'Nguyễn Thành Long', '24 Vạn Xuân', 'Đà Lạt', '0353292241', 'thanhlongedu0304@gmail.com', '', 0, 0, 581600, 581600, 4),
(30, '15:14:46 22/03/2023', '15:15:06 22/03/2023', NULL, 'Bot Bot', 'Nguyễn Văn Trỗi', 'Đà Lạt', '0123456788', 'nguyenlong0304tester1@gmail.com', 'Shop giao hàng sớm nhé', 3, 0, 630000, 504000, 4),
(32, '15:43:31 22/03/2023', NULL, NULL, 'Mimi', '213 ABC', 'Hà Nội', '0123456666', 'nguyenlong0304tester2@gmail.com', '', 3, 0, 300000, 240000, 1),
(33, '15:40:48 04/05/2023', '17:41:17 04/05/2023', NULL, 'Nguyễn Thành Long', '24 Vạn Xuân', 'Đà Lạt', '0353292241', 'thanhlongedu0304@gmail.com', '', 0, 0, 566000, 566000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`) VALUES
(1, '09:43:18 04/03/2023', NULL, NULL, 'Đang chờ duyệt'),
(2, '09:43:18 04/03/2023', NULL, NULL, 'Đã duyệt'),
(3, '09:43:18 04/03/2023', NULL, NULL, 'Đã từ chối'),
(4, '09:43:18 04/03/2023', NULL, NULL, 'Đã thanh toán'),
(5, '09:43:18 04/03/2023', NULL, NULL, 'Yêu cầu hủy'),
(6, '09:43:18 04/03/2023', NULL, NULL, 'Đã hủy'),
(7, '09:43:18 04/03/2023', NULL, NULL, 'Yêu cầu hoàn tiền'),
(8, '09:43:18 04/03/2023', NULL, NULL, 'Đã hoàn tiền');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `featureImageId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `originPrice` int(11) DEFAULT 0,
  `promotionPrice` int(11) DEFAULT 0,
  `unit` varchar(255) NOT NULL,
  `shortDescription` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `isSpecial` tinyint(1) DEFAULT 0,
  `isNew` tinyint(1) DEFAULT 0,
  `isBestOffer` tinyint(1) DEFAULT 0,
  `productCategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `featureImageId`, `name`, `originPrice`, `promotionPrice`, `unit`, `shortDescription`, `description`, `isSpecial`, `isNew`, `isBestOffer`, `productCategoryId`) VALUES
(16, '16:04:36 14/03/2023', '20:33:31 19/03/2023', NULL, 144, 'Ớt cay hủy diệt', 50000, 32000, '100g', 'Ớt này ăn cay lắm nha :))', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 4),
(17, '16:05:46 14/03/2023', '19:39:14 19/03/2023', NULL, 148, 'Dền tươi', 99000, 99000, '200g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 4),
(18, '16:19:34 14/03/2023', '20:38:11 19/03/2023', NULL, 157, 'Dưa không biết tên', 250000, 120000, '500g', 'Dưa này tên gì chính nó cũng không biết nữa', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 1, 1, 2),
(19, '16:22:49 14/03/2023', '20:38:20 19/03/2023', NULL, 165, 'Bắp cãi lại vợ', 80000, 80000, '700g', 'Bắp cãi này dám cãi lại nóc nhà lun. Thật là đáng bị bỏ vào nồi mà...', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 1, 0, 1),
(20, '16:23:40 14/03/2023', '19:38:41 19/03/2023', NULL, 168, 'Bắp cải hữu cơ', 65000, 65000, '700g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 1),
(21, '16:24:31 14/03/2023', '20:32:32 19/03/2023', NULL, 171, 'Súp lơ hữu cơ', 100000, 100000, '600g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 1),
(22, '16:25:58 14/03/2023', '20:30:35 19/03/2023', NULL, 174, 'Mứt dâu', 230000, 210000, '1 hũ', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 1, 0, 3),
(23, '16:27:14 14/03/2023', '20:37:55 19/03/2023', NULL, 177, 'Hành củ tươi', 72000, 72000, '300g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 1, 0, 4),
(24, '16:28:50 14/03/2023', '20:38:02 19/03/2023', NULL, 180, 'Cà chua Alpha', 65000, 55000, '300g', 'Cà chua như cuộc đời của bạn vậy', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 1, 1, 4),
(25, '16:30:01 14/03/2023', '20:33:57 19/03/2023', NULL, 183, 'Táo thần', 320000, 300000, '300g', 'Táo này ăn vào sẽ bất tử, thích hợp để chuẩn bị trước khi quậy nóc nhà', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 1, 2),
(26, '16:31:21 14/03/2023', '20:38:26 19/03/2023', NULL, 186, 'Chuối rừng Amazon', 400000, 300000, '500g', 'Chuối này hái ở tận rừng Amazon, nơi có những con khỉ vô cùng hung hãn', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 1, 1, 2),
(29, '10:22:12 18/03/2023', '17:34:15 18/03/2023', '17:34:31 18/03/2023', 222, 'San pham test delete', 10000, 10000, '1 kg', '', '<p><br></p>', 1, 0, 1, 16),
(30, '18:15:45 19/03/2023', '19:36:51 19/03/2023', NULL, 224, 'Bắp cải tím hữu cơ', 55000, 55000, '500g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm 123 hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 1),
(31, '18:19:47 19/03/2023', '19:37:01 19/03/2023', NULL, 227, 'Cải thìa hữu cơ', 68000, 68000, '300g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 1),
(32, '18:22:01 19/03/2023', '19:37:10 19/03/2023', NULL, 230, 'Cải thảo hữu cơ', 62000, 62000, '300g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 1),
(33, '18:27:42 19/03/2023', '19:39:06 19/03/2023', NULL, 233, 'Cà rốt hữu cơ', 43500, 43500, '200g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 4),
(34, '18:29:47 19/03/2023', '19:37:27 19/03/2023', NULL, 236, 'Bí ngòi hữu cơ', 88500, 88500, '300g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 4),
(35, '18:30:57 19/03/2023', '19:37:38 19/03/2023', NULL, 239, 'Bắp ngọt hữu cơ', 102000, 102000, '500g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 4),
(36, '18:34:18 19/03/2023', '19:37:53 19/03/2023', NULL, 242, 'Bí đỏ hạt đậu', 96000, 96000, '500g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 4),
(37, '18:36:05 19/03/2023', '19:38:02 19/03/2023', NULL, 245, 'Cà chua trái cây berry vàng', 125000, 125000, '300g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 13),
(38, '18:39:22 19/03/2023', '20:35:22 19/03/2023', NULL, 248, 'Bơ sáp hữu cơ', 119000, 119000, '500g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 1, 0, 0, 2),
(39, '18:41:00 19/03/2023', '20:35:07 19/03/2023', NULL, 251, 'Cam vàng úc', 159000, 159000, '300g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 1, 0, 0, 2),
(40, '19:22:34 19/03/2023', '20:30:49 19/03/2023', NULL, 254, 'Nho mẫu đơn Hàn Quốc', 2204000, 1904000, '1 thùng (2 kg)', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 1, 0, 1, 2),
(41, '19:24:05 19/03/2023', '20:35:54 19/03/2023', NULL, 257, 'Kiwi vàng Pháp', 223500, 223500, '500g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 1, 0, 0, 2),
(42, '19:25:38 19/03/2023', '20:39:34 19/03/2023', NULL, 260, 'Cherry đỏ úc', 3450000, 3000000, '1 thùng (2 kg)', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 1, 13),
(43, '19:31:56 19/03/2023', '20:36:06 19/03/2023', NULL, 263, 'Việt quất jumbo', 159000, 159000, '125g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 1, 0, 0, 13),
(44, '19:43:44 19/03/2023', '20:31:08 19/03/2023', NULL, 266, 'Bột mì đa dụng', 121000, 121000, '1 gói', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 15),
(45, '19:45:01 19/03/2023', '20:31:17 19/03/2023', NULL, 269, 'Bột chiên xù', 144000, 129600, '1 hộp', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 15),
(46, '19:53:22 19/03/2023', '19:53:32 19/03/2023', NULL, 272, 'Nấm đông cô', 79000, 79000, '300g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 14),
(47, '19:54:29 19/03/2023', '20:36:29 19/03/2023', NULL, 274, 'Nấm linh chi đỏ', 158000, 158000, '40g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 1, 0, 0, 14),
(48, '20:24:50 19/03/2023', '20:28:02 19/03/2023', NULL, 276, 'Ba chỉ bò Obe', 225000, 225000, '300g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 12),
(49, '20:27:46 19/03/2023', '20:39:21 19/03/2023', NULL, 279, 'Bắp heo rút xương', 165000, 135000, '500g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 1, 12),
(50, '20:28:59 19/03/2023', '20:29:08 19/03/2023', NULL, 282, 'Cá chẽm tự nhiên', 238000, 238000, '550g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 12),
(51, '20:30:13 19/03/2023', '20:36:38 19/03/2023', NULL, 285, 'Bò lúc lắc Obe', 232500, 232500, '1 hộp', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 1, 0, 0, 12),
(52, '18:23:51 20/03/2023', '18:24:15 20/03/2023', NULL, 291, 'Lá bạc hà', 30000, 30000, '50g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 1),
(53, '18:25:03 20/03/2023', '18:25:16 20/03/2023', NULL, 293, 'Cải bẹ xanh', 38000, 38000, '300g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 1),
(54, '18:25:45 20/03/2023', '18:26:03 20/03/2023', NULL, 295, 'Cải bó xôi', 47500, 47500, '250g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 1),
(55, '18:26:47 20/03/2023', '18:26:59 20/03/2023', NULL, 297, 'Cải ngồng', 38000, 38000, '300g', 'Thực phẩm hữu cơ thường tốt cho môi trường', '<p>Thực phẩm hữu cơ thường tốt cho môi trường. Tuy nhiên, nó cũng tương đối đắt hơn: USDA (Bộ Nông nghiệp Hoa Kỳ) báo cáo rằng giá của trái cây và rau hữu cơ thường cao hơn 20% so với các sản phẩm thông thường. Đôi khi sự khác biệt có thể cao hơn nhiều, đặc biệt đối với một số mặt hàng như sữa hữu cơ và trứng.</p><p>Bạn biết cách đọc nhãn trên các sản phẩm hữu cơ để giúp chúng tôi lựa chọn thực phẩm tốt hơn. Có ba loại nhãn hữu cơ phổ biến:</p><ul><li>“100% hữu cơ”: tức là tất cả các thành phần trong thực phẩm đều được chứng nhận hữu cơ.</li><li>“Hữu cơ”: ít nhất 95% thành phần được chứng nhận hữu cơ.</li><li>“Được làm bằng các sản phẩm hữu cơ”: ít nhất 70% thành phần được chứng nhận hữu cơ.</li></ul>', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `featureImageId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`, `featureImageId`) VALUES
(1, '15:32:45 12/03/2023', '14:43:58 14/03/2023', NULL, 'Rau xanh', 129),
(2, '15:57:54 12/03/2023', '14:49:36 14/03/2023', NULL, 'Trái cây', 132),
(3, '16:53:17 12/03/2023', '14:51:49 14/03/2023', NULL, 'Mứt & Thức uống', 128),
(4, '18:23:24 12/03/2023', '15:32:03 14/03/2023', NULL, 'Củ & Quả', 131),
(12, '13:41:29 14/03/2023', '15:03:22 14/03/2023', NULL, 'Thịt & Hải sản', 133),
(13, '13:43:28 14/03/2023', '19:26:19 19/03/2023', NULL, 'Cherry & Berry', 130),
(14, '13:43:44 14/03/2023', '14:36:40 14/03/2023', NULL, 'Nấm', 126),
(15, '14:25:59 14/03/2023', '18:09:52 19/03/2023', NULL, 'Bột & Gia vị', 134),
(16, '14:27:36 14/03/2023', '14:36:59 14/03/2023', NULL, 'Trứng', 127),
(19, '10:23:16 18/03/2023', NULL, '10:23:43 18/03/2023', 'Danh muc test delete', 223);

-- --------------------------------------------------------

--
-- Table structure for table `productreview`
--

CREATE TABLE `productreview` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `isShow` tinyint(1) NOT NULL DEFAULT 1,
  `repliedAt` varchar(255) DEFAULT NULL,
  `replyMessage` text DEFAULT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productreview`
--

INSERT INTO `productreview` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `fullname`, `phone`, `email`, `comment`, `rating`, `isShow`, `repliedAt`, `replyMessage`, `productId`) VALUES
(10, '15:07:26 22/03/2023', NULL, NULL, 'Nguyễn Thành Long', '0353292241', 'thanhlongedu0304@gmail.com', 'Sản phẩm tốt, chất lượng cao, mua về rất ưng ý', 5, 1, '15:17:03 22/03/2023', 'Cảm ơn bạn đã mua hàng của chúng tôi', 22),
(11, '15:16:07 22/03/2023', NULL, NULL, 'Bot Bot', '0123456788', 'nguyenlong0304tester1@gmail.com', 'Mứt dâu khá ngon, nhưng hũ chưa được to lắm', 4, 1, '15:16:48 22/03/2023', 'Cảm ơn bạn đã mua hàng của chúng tôi, chúng tôi sẽ ghi nhận đánh giá của bạn', 22);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `productId` int(11) NOT NULL,
  `imageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`productId`, `imageId`) VALUES
(16, 145),
(16, 146),
(16, 147),
(17, 149),
(17, 150),
(18, 158),
(18, 159),
(18, 160),
(19, 166),
(19, 167),
(20, 170),
(20, 169),
(21, 172),
(21, 173),
(22, 175),
(22, 176),
(23, 178),
(23, 179),
(24, 181),
(24, 182),
(25, 184),
(25, 185),
(26, 187),
(26, 188),
(30, 225),
(30, 226),
(31, 228),
(31, 229),
(32, 231),
(32, 232),
(33, 234),
(33, 235),
(34, 238),
(34, 237),
(35, 241),
(35, 240),
(36, 243),
(36, 244),
(37, 246),
(37, 247),
(38, 249),
(38, 250),
(39, 252),
(40, 255),
(40, 256),
(41, 258),
(41, 259),
(42, 261),
(42, 262),
(43, 264),
(43, 265),
(44, 267),
(44, 268),
(45, 270),
(45, 271),
(46, 273),
(47, 275),
(48, 277),
(48, 278),
(49, 280),
(49, 281),
(50, 283),
(50, 284),
(51, 287),
(51, 286),
(52, 292),
(53, 294),
(54, 296),
(55, 298);

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `productId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_order`
--

INSERT INTO `product_order` (`productId`, `orderId`, `quantity`) VALUES
(40, 26, 2),
(30, 27, 2),
(31, 27, 4),
(26, 28, 3),
(18, 28, 3),
(39, 28, 3),
(22, 29, 1),
(45, 29, 1),
(44, 29, 2),
(22, 30, 3),
(21, 32, 3),
(31, 33, 2),
(30, 33, 2),
(22, 33, 1),
(24, 33, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `email`) VALUES
(11, '11:09:06 20/03/2023', NULL, NULL, 'thanhlongedu0304@gmail.com'),
(19, '14:26:56 20/03/2023', NULL, NULL, 'nguyenlong0304tester1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `systemadmin`
--

CREATE TABLE `systemadmin` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `avatarId` int(11) DEFAULT NULL,
  `systemRoleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `systemadmin`
--

INSERT INTO `systemadmin` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `username`, `password`, `nickname`, `email`, `phone`, `avatarId`, `systemRoleId`) VALUES
(4, '18:08:50 04/03/2023', '17:34:50 04/05/2023', NULL, 'dragondev0304', '0192023a7bbd73250516f069df18b500', 'Thành Long', 'dragondevshop@gmail.com', '0353292241', 18, 1),
(5, '18:46:33 04/03/2023', '10:01:40 16/03/2023', NULL, 'client', '202cb962ac59075b964b07152d234b70', 'Client', 'dragondevshop@gmail.com', '0353292241', 26, 2),
(16, '14:26:09 07/03/2023', '11:39:30 04/05/2023', NULL, 'websitemanager1', '0192023a7bbd73250516f069df18b500', 'Quản lý website 1', '2014468@dlu.edu.vn', '0000001234', NULL, 3),
(17, '11:36:09 11/03/2023', '15:30:52 19/03/2023', NULL, 'admin123', '0192023a7bbd73250516f069df18b500', 'Thành Long', 'thanhlongedu0304@gmail.com', '0353292241', 28, 3),
(20, '09:17:22 18/03/2023', NULL, '09:18:03 18/03/2023', 'AdminTesting', '202cb962ac59075b964b07152d234b70', 'Admin Testing', '2014468@dlu.edu.vn', '0123456789', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `systemfunction`
--

CREATE TABLE `systemfunction` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `apiPath` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `isBase` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `systemfunction`
--

INSERT INTO `systemfunction` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `apiPath`, `name`, `description`, `method`, `isBase`) VALUES
(2, '22:14:51 07/03/2023', NULL, NULL, 'system_menu/add.php', 'AddSystemMenu', 'Add system menu', 'POST', 0),
(3, '22:15:19 07/03/2023', NULL, NULL, 'system_menu/delete.php', 'DeleteSystemMenu', 'Delete system menu by id', 'DELETE', 0),
(4, '22:15:43 07/03/2023', NULL, NULL, 'system_menu/get_item.php', 'GetSystemMenuItem', 'Get system menu item by id', 'GET', 0),
(5, '22:18:16 07/03/2023', NULL, NULL, 'system_menu/get_list_by_system_role_id.php', 'GetSystemMenuListBySystemRoleId', 'Get system menu list by system role id ', 'GET', 0),
(6, '22:25:58 07/03/2023', NULL, NULL, 'system_menu/get_list.php', 'GetSystemMenuList', 'Get system menu list', 'GET', 0),
(7, '22:26:26 07/03/2023', NULL, NULL, 'system_menu/trash.php', 'TrashSystemMenu', 'Trash system menu by id', 'PUT', 0),
(8, '22:26:48 07/03/2023', '09:34:47 16/03/2023', NULL, 'system_menu/update.php', 'UpdateSystemMenu', 'Update system menu by id', 'PUT', 0),
(9, '22:36:47 07/03/2023', NULL, NULL, 'system_role/add.php', 'AddSystemRole', 'Add system role', 'POST', 0),
(10, '22:37:58 07/03/2023', NULL, NULL, 'system_role/delete.php', 'DeleteSystemRole', 'Delete system role by id', 'DELETE', 0),
(11, '22:38:31 07/03/2023', '11:18:53 09/03/2023', NULL, 'system_role/get_item.php', 'GetSystemRoleItem', 'Get system role item by id', 'GET', 0),
(12, '22:38:48 07/03/2023', NULL, NULL, 'system_role/get_list.php', 'GetSystemRoleList', 'Get system role list', 'GET', 0),
(13, '22:39:13 07/03/2023', NULL, NULL, 'system_role/trash.php', 'TrashSystemRole', 'Trash system role by id', 'PUT', 0),
(14, '22:39:38 07/03/2023', '09:34:54 16/03/2023', NULL, 'system_role/update.php', 'UpdateSystemRole', 'Update system role by id', 'PUT', 0),
(15, '14:57:26 08/03/2023', NULL, NULL, 'system_function/add.php', 'AddSystemFunction', 'Add system function', 'POST', 0),
(16, '14:59:45 08/03/2023', NULL, NULL, 'system_function/delete.php', 'DeleteSystemFunction', 'Delete system function by id', 'DELETE', 0),
(17, '15:00:08 08/03/2023', NULL, NULL, 'system_function/get_item.php', 'GetSystemFunctionItem', 'Get system function item by id', 'GET', 0),
(18, '15:00:30 08/03/2023', NULL, NULL, 'system_function/get_list_by_system_role_id.php', 'GetSystemFunctionListBySystemRoleId', 'Get system function list by system role id', 'GET', 0),
(19, '15:00:45 08/03/2023', NULL, NULL, 'system_function/get_list.php', 'GetSystemFunctionList', 'Get system function list', 'GET', 0),
(20, '15:01:06 08/03/2023', '09:34:33 16/03/2023', NULL, 'system_function/trash.php', 'TrashSystemFunction', 'Trash system function by id', 'PUT', 0),
(21, '15:01:20 08/03/2023', '09:34:36 16/03/2023', NULL, 'system_function/update.php', 'UpdateSystemFunction', 'Update system function by id', 'PUT', 0),
(22, '15:02:27 08/03/2023', NULL, NULL, 'system_role_menu/add.php', 'AddSystemRoleMenu', 'Add system role menu', 'POST', 0),
(23, '15:02:56 08/03/2023', '13:31:41 19/03/2023', NULL, 'system_role_menu/delete.php', 'DeleteSystemRoleMenu', 'Delete system role menu', 'DELETE', 0),
(24, '15:03:24 08/03/2023', NULL, NULL, 'system_role_function/add.php', 'AddSystemRoleFunction', 'Add system role function', 'POST', 0),
(25, '15:03:44 08/03/2023', '13:31:56 19/03/2023', NULL, 'system_role_function/delete.php', 'DeleteSystemRoleFunction', 'Delete system role function', 'DELETE', 0),
(26, '15:04:17 08/03/2023', '14:24:15 16/03/2023', NULL, 'system_admin/login.php', 'LoginSystemAdmin', 'Login system admin', 'POST', 1),
(27, '15:04:58 08/03/2023', NULL, NULL, 'system_admin/register.php', 'RegisterSystemAdmin', 'Register system admin', 'POST', 0),
(28, '15:05:33 08/03/2023', NULL, NULL, 'system_admin/delete.php', 'DeleteSystemAdmin', 'Delete system admin by id', 'DELETE', 0),
(29, '15:05:58 08/03/2023', NULL, NULL, 'system_admin/get_item.php', 'GetSystemAdminItem', 'Get system admin item by id', 'GET', 0),
(30, '15:06:19 08/03/2023', NULL, NULL, 'system_admin/get_list.php', 'GetSystemAdminList', 'Get system admin list', 'GET', 0),
(31, '15:06:56 08/03/2023', NULL, NULL, 'system_admin/reset_password.php', 'ResetPasswordSystemAdmin', 'Reset password system admin, send new password in email', 'PUT', 0),
(32, '15:07:16 08/03/2023', '09:33:52 16/03/2023', NULL, 'system_admin/trash.php', 'TrashSystemAdmin', 'Trash system admin by id', 'PUT', 0),
(33, '15:08:08 08/03/2023', '09:34:03 16/03/2023', NULL, 'system_admin/update_avatar.php', 'UpdateAvatarSystemAdmin', 'Update avatar system admin by id', 'PUT', 0),
(34, '15:08:29 08/03/2023', '09:34:05 16/03/2023', NULL, 'system_admin/update_email.php', 'UpdateEmailSystemAdmin', 'Update email system admin by id', 'PUT', 0),
(35, '15:08:43 08/03/2023', '09:34:08 16/03/2023', NULL, 'system_admin/update_nickname.php', 'UpdateNicknameSystemAdmin', 'Update nickname system admin by id', 'PUT', 0),
(36, '15:09:06 08/03/2023', '09:34:11 16/03/2023', NULL, 'system_admin/update_password.php', 'UpdatePasswordSystemAdmin', 'Update password system admin by id', 'PUT', 0),
(37, '15:09:15 08/03/2023', '09:34:14 16/03/2023', NULL, 'system_admin/update_phone.php', 'UpdatePhoneSystemAdmin', 'Update phone system admin by id', 'PUT', 0),
(44, '11:52:12 11/03/2023', '09:34:18 16/03/2023', NULL, 'system_admin/update_system_role.php', 'UpdateSystemRoleForSystemAdmin', 'Update system role for system admin by id', 'PUT', 0),
(45, '18:10:15 11/03/2023', '09:32:37 16/03/2023', NULL, 'image/delete.php', 'DeleteImage', 'Delete image by id', 'POST, PUT, DELETE', 0),
(46, '18:10:44 11/03/2023', '09:32:44 16/03/2023', NULL, 'image/get_item.php', 'GetImageItem', 'Get image item by id', 'GET', 0),
(47, '18:11:21 11/03/2023', NULL, NULL, 'image/get_list.php', 'GetImageList', 'Get image list', 'GET', 0),
(48, '18:11:54 11/03/2023', NULL, NULL, 'image/upload.php', 'UploadImage', 'Upload image', 'POST', 0),
(49, '18:15:08 11/03/2023', NULL, NULL, '', 'RemoveImageDontUse', 'Remove image dont use', '', 0),
(50, '18:15:46 11/03/2023', NULL, NULL, '', 'ViewImage', 'View image', '', 0),
(51, '15:41:03 12/03/2023', NULL, NULL, 'product_category/add.php', 'AddProductCategory', 'Add product category', 'POST', 0),
(52, '15:41:27 12/03/2023', '09:33:10 16/03/2023', NULL, 'product_category/delete.php', 'DeleteProductCategory', 'Delete product category by id', 'DELETE', 0),
(53, '15:41:48 12/03/2023', '14:28:50 19/03/2023', NULL, 'product_category/get_item.php', 'GetProductCategoryItem', 'Get product category item by id', 'GET', 0),
(54, '15:42:20 12/03/2023', NULL, NULL, 'product_category/get_list.php', 'GetProductCategoryList', 'Get product category list', 'GET', 0),
(55, '15:42:49 12/03/2023', '09:33:19 16/03/2023', NULL, 'product_category/trash.php', 'TrashProductCategory', 'Trash product category by id', 'PUT', 0),
(56, '15:43:30 12/03/2023', '09:33:28 16/03/2023', NULL, 'product_category/update.php', 'UpdateProductCategory', 'Update product category by id', 'PUT', 0),
(57, '08:58:15 13/03/2023', NULL, NULL, 'product/add.php', 'AddProduct', 'Add product', 'POST', 0),
(58, '08:58:39 13/03/2023', '09:32:51 16/03/2023', NULL, 'product/delete.php', 'DeleteProduct', 'Delete product by id', 'DELETE', 0),
(59, '08:58:58 13/03/2023', '09:32:55 16/03/2023', NULL, 'product/get_item.php', 'GetProductItem', 'Get product item by id', 'GET', 0),
(60, '08:59:18 13/03/2023', NULL, NULL, 'product/get_list.php', 'GetProductList', 'Get product list', 'GET', 0),
(61, '08:59:43 13/03/2023', '09:33:00 16/03/2023', NULL, 'product/trash.php', 'TrashProduct', 'Trash product by id', 'PUT', 0),
(62, '09:00:05 13/03/2023', '09:33:04 16/03/2023', NULL, 'product/update.php', 'UpdateProduct', 'Update product by id', 'PUT', 0),
(63, '09:49:20 14/03/2023', NULL, NULL, 'product_image/add_list.php', 'AddProductImageList', 'Add product image list', 'POST', 0),
(64, '10:05:12 14/03/2023', NULL, NULL, 'product_image/delete_list.php', 'DeleteProductImageList', 'Delete product image list', 'DELETE', 0),
(65, '12:09:36 14/03/2023', NULL, NULL, 'product_image/get_list_by_product_id.php', 'GetProductImageListByProductId', 'Get product image list by product id', 'GET', 0),
(66, '16:35:46 14/03/2023', '09:31:12 16/03/2023', NULL, '', 'ViewProductDetails', 'View product details by id', '', 0),
(67, '20:25:32 14/03/2023', NULL, NULL, 'blog/add.php', 'AddBlog', 'Add blog', 'POST', 0),
(68, '20:25:59 14/03/2023', '09:31:28 16/03/2023', NULL, 'blog/delete.php', 'DeleteBlog', 'Delete blog by id', 'DELETE', 0),
(69, '20:26:20 14/03/2023', '09:31:39 16/03/2023', NULL, 'blog/get_item.php', 'GetBlogItem', 'Get blog item by id', 'GET', 0),
(70, '20:26:56 14/03/2023', NULL, NULL, 'blog/get_list.php', 'GetBlogList', 'Get blog list', 'GET', 0),
(71, '20:27:18 14/03/2023', '09:31:45 16/03/2023', NULL, 'blog/trash.php', 'TrashBlog', 'Trash blog by id', 'PUT', 0),
(72, '20:27:39 14/03/2023', '09:32:10 16/03/2023', NULL, 'blog/update.php', 'UpdateBlog', 'Update blog by id', 'PUT', 0),
(73, '20:29:52 14/03/2023', '09:31:21 16/03/2023', NULL, '', 'ViewBlogDetails', 'View blog details by id', '', 0),
(74, '09:27:29 16/03/2023', NULL, NULL, 'contact/add.php', 'AddContact', 'Add contact', 'POST', 0),
(75, '09:27:55 16/03/2023', NULL, NULL, 'contact/delete.php', 'DeleteContact', 'Delete contact by id', 'DELETE', 0),
(76, '09:28:18 16/03/2023', NULL, NULL, 'contact/get_item.php', 'GetContactItem', 'Get contact item by id', 'GET', 0),
(77, '09:28:47 16/03/2023', NULL, NULL, 'contact/get_list.php', 'GetContactList', 'Get contact list', 'GET', 0),
(78, '09:29:06 16/03/2023', NULL, NULL, 'contact/trash.php', 'TrashContact', 'Trash contact by id', 'PUT', 0),
(79, '09:37:21 16/03/2023', NULL, NULL, 'coupon_code/add.php', 'AddCouponCode', 'Add conpon code', 'POST', 0),
(80, '09:37:51 16/03/2023', NULL, NULL, 'coupon_code/delete.php', 'DeleteCouponCode', 'Delete coupon code by id', 'DELETE', 0),
(81, '09:38:16 16/03/2023', '09:42:10 16/03/2023', NULL, 'coupon_code/get_item.php', 'GetCouponCodeItem', 'Get coupon code item by id', 'GET', 0),
(82, '09:38:37 16/03/2023', '09:54:12 16/03/2023', NULL, 'coupon_code/get_list.php', 'GetCouponCodeList', 'Get coupon code list', 'GET', 0),
(83, '09:39:00 16/03/2023', '09:42:14 16/03/2023', NULL, 'coupon_code/trash.php', 'TrashCouponCode', 'Trash coupon code by id', 'PUT', 0),
(84, '09:39:34 16/03/2023', '09:42:16 16/03/2023', NULL, 'coupon_code/update.php', 'UpdateCouponCode', 'Update coupon code by id', 'PUT', 0),
(85, '09:41:48 16/03/2023', NULL, NULL, 'subscribe/add.php', 'AddSubscribe', 'Add subscribe', 'POST', 0),
(86, '09:42:47 16/03/2023', NULL, NULL, 'subscribe/delete.php', 'DeleteSubscribe', 'Delete subscribe by id', 'DELETE', 0),
(87, '09:43:14 16/03/2023', NULL, NULL, 'subscribe/get_item.php', 'GetSubscribeItem', 'Get subscribe item by id', 'GET', 0),
(88, '09:43:38 16/03/2023', NULL, NULL, 'subscribe/get_list.php', 'GetSubscribeList', 'Get subscribe list', 'GET', 0),
(89, '09:44:00 16/03/2023', NULL, NULL, 'subscribe/trash.php', 'TrashSubscribe', 'Trash subscribe by id', 'PUT', 0),
(90, '09:46:11 16/03/2023', NULL, NULL, 'order_status/add.php', 'AddOrderStatus', 'Add order status', 'POST', 0),
(91, '09:46:38 16/03/2023', NULL, NULL, 'order_status/delete.php', 'DeleteOrderStatus', 'Delete order status by id', 'DELETE', 0),
(92, '09:47:03 16/03/2023', NULL, NULL, 'order_status/get_item.php', 'GetOrderStatusItem', 'Get order status item by id', 'GET', 0),
(93, '09:47:34 16/03/2023', NULL, NULL, 'order_status/get_list.php', 'GetOrderStatusList', 'Get order status list', 'GET', 0),
(94, '09:47:59 16/03/2023', '09:48:37 16/03/2023', NULL, 'order_status/trash.php', 'TrashOrderStatus', 'Trash order status by id', 'PUT', 0),
(95, '09:48:23 16/03/2023', '09:48:39 16/03/2023', NULL, 'order_status/update.php', 'UpdateOrderStatus', 'Update order status by id', 'PUT', 0),
(97, '08:49:26 17/03/2023', '09:01:50 17/03/2023', NULL, '', 'ViewContactDetails', 'View contact details by id', '', 0),
(98, '09:33:21 17/03/2023', '11:36:13 19/03/2023', NULL, 'contact/reply.php', 'ReplyContact', 'Reply contact by id', 'POST', 0),
(99, '19:10:48 17/03/2023', NULL, NULL, 'order/add.php', 'AddOrder', 'Add order', 'POST', 0),
(100, '20:49:57 17/03/2023', '20:50:13 17/03/2023', NULL, 'order/delete.php', 'DeleteOrder', 'Delete order by id', 'DELETE', 0),
(101, '20:50:30 17/03/2023', NULL, NULL, 'order/get_item.php', 'GetOrderItem', 'Get order item by id', 'GET', 0),
(102, '20:50:44 17/03/2023', NULL, NULL, 'order/get_list.php', 'GetOrderList', 'Get order list', 'GET', 0),
(103, '20:51:06 17/03/2023', NULL, NULL, 'order/trash.php', 'TrashOrder', 'Trash order by id', 'PUT', 0),
(104, '20:51:34 17/03/2023', NULL, NULL, 'order/update_order_status_for_order.php', 'UpdateOrderStatusForOrder', 'Update order status for order', 'PUT', 0),
(105, '20:53:19 17/03/2023', NULL, NULL, '', 'ViewOrderDetails', 'View order details by id', '', 0),
(106, '22:12:35 17/03/2023', '22:14:25 17/03/2023', NULL, 'product_order/get_list_by_order_id.php', 'GetProductOrderListByOrderId', 'Get product order list by order id', 'GET', 0),
(107, '09:29:19 18/03/2023', NULL, NULL, 'product_order/add_list.php', 'AddProductOrderList', 'Add product order list', 'POST', 0),
(108, '18:54:24 18/03/2023', '20:58:49 18/03/2023', NULL, 'coupon_code/get_item_by_code.php', 'GetCouponCodeItemByCode', 'Get coupon code item by code', 'POST', 0),
(109, '21:08:24 18/03/2023', '21:14:44 18/03/2023', NULL, 'mail/send_customize.php', 'SendCustomizeMail', 'Send customize mail', 'POST', 0),
(110, '21:45:39 18/03/2023', '10:33:01 19/03/2023', NULL, 'product_review/add.php', 'AddProductReview', 'Add product review', 'POST', 0),
(111, '08:59:54 19/03/2023', '14:32:37 19/03/2023', NULL, 'product_review/get_list_for_product.php', 'GetProductReviewListForProduct', 'Get product review list for product', 'GET', 0),
(112, '09:30:12 19/03/2023', '11:45:42 19/03/2023', NULL, '', 'ViewProductReviewDetails', 'View product review details by id', '', 0),
(113, '11:11:43 19/03/2023', '11:33:52 19/03/2023', NULL, 'product_review/update.php', 'UpdateProductReview', 'Update product review by id', 'PUT', 0),
(114, '11:34:29 19/03/2023', NULL, NULL, 'product_review/delete.php', 'DeleteProductReview', 'Delete product review by id', 'DELETE', 0),
(115, '11:35:01 19/03/2023', NULL, NULL, 'product_review/get_item.php', 'GetProductReviewItem', 'Get product review item by id', 'GET', 0),
(116, '11:35:33 19/03/2023', NULL, NULL, 'product_review/reply.php', 'ReplyProductReview', 'Reply product review by id', 'POST', 0),
(117, '11:35:54 19/03/2023', NULL, NULL, 'product_review/trash.php', 'TrashProductReview', 'Trash product review by id', 'PUT', 0),
(118, '12:17:42 19/03/2023', NULL, NULL, 'product_review/remove_reply.php', 'RemoveReplyProductReview', 'Remove reply product review by id', 'PUT', 0);

-- --------------------------------------------------------

--
-- Table structure for table `systemmenu`
--

CREATE TABLE `systemmenu` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `routeName` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `isBase` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `systemmenu`
--

INSERT INTO `systemmenu` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `routeName`, `title`, `isBase`) VALUES
(1, '15:17:32 05/03/2023', NULL, NULL, 'Dashboard', 'Dashboard', 1),
(2, '15:18:38 05/03/2023', '18:26:55 06/03/2023', NULL, 'SystemRole', 'Vai trò', 0),
(3, '15:19:39 05/03/2023', '18:27:01 06/03/2023', NULL, 'SystemMenu', 'Menu', 0),
(4, '15:19:43 05/03/2023', '18:27:26 06/03/2023', NULL, 'SystemFunction', 'Chức năng', 0),
(5, '15:19:46 05/03/2023', NULL, NULL, 'SystemAdmin', 'Tài khoản Admin', 0),
(6, '15:19:51 05/03/2023', NULL, NULL, 'Image', 'Tệp hình ảnh', 0),
(7, '15:19:55 05/03/2023', NULL, NULL, 'ProductCategory', 'Danh mục sản phẩm', 0),
(8, '15:19:59 05/03/2023', NULL, NULL, 'Product', 'Sản phẩm', 0),
(9, '15:27:14 05/03/2023', NULL, NULL, 'AddProduct', 'Thêm sản phẩm', 0),
(10, '15:27:17 05/03/2023', NULL, NULL, 'EditProduct', 'Chỉnh sửa sản phẩm', 0),
(11, '15:27:21 05/03/2023', NULL, NULL, 'Blog', 'Bài viết', 0),
(12, '15:27:25 05/03/2023', NULL, NULL, 'AddBlog', 'Thêm bài viết', 0),
(13, '15:27:29 05/03/2023', NULL, NULL, 'EditBlog', 'Chỉnh sửa bài viết', 0),
(14, '15:27:34 05/03/2023', NULL, NULL, 'Subscribe', 'Khách hàng đăng ký', 0),
(15, '15:27:38 05/03/2023', NULL, NULL, 'Contact', 'Khách hàng liên hệ', 0),
(16, '15:27:41 05/03/2023', '10:14:14 16/03/2023', NULL, 'CouponCode', 'Mã giảm giá', 0),
(17, '15:27:45 05/03/2023', NULL, NULL, 'OrderStatus', 'Trạng thái đơn hàng', 0),
(18, '15:27:48 05/03/2023', NULL, NULL, 'Order', 'Đơn hàng', 0),
(19, '15:27:52 05/03/2023', '10:06:35 07/03/2023', NULL, 'Profile', 'Hồ sơ cá nhân', 1),
(20, '15:28:12 05/03/2023', NULL, NULL, 'Signin', 'Đăng nhập', 1),
(51, '09:04:33 19/03/2023', NULL, NULL, 'ProductReview', 'Đánh giá sản phẩm', 0);

-- --------------------------------------------------------

--
-- Table structure for table `systemrole`
--

CREATE TABLE `systemrole` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `systemrole`
--

INSERT INTO `systemrole` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`) VALUES
(1, '09:43:18 04/03/2023', '13:17:33 07/03/2023', NULL, 'Quản lý hệ thống'),
(2, '09:44:00 04/03/2023', '09:52:19 04/03/2023', NULL, 'Ứng dụng'),
(3, '09:49:56 04/03/2023', '13:17:24 07/03/2023', NULL, 'Quản lý website'),
(4, '09:50:15 04/03/2023', NULL, NULL, 'Hỗ trợ khách hàng');

-- --------------------------------------------------------

--
-- Table structure for table `systemrole_function`
--

CREATE TABLE `systemrole_function` (
  `systemRoleId` int(11) NOT NULL,
  `systemFunctionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `systemrole_function`
--

INSERT INTO `systemrole_function` (`systemRoleId`, `systemFunctionId`) VALUES
(1, 12),
(1, 15),
(1, 24),
(1, 25),
(1, 3),
(1, 26),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 4),
(1, 5),
(1, 6),
(1, 9),
(1, 10),
(1, 11),
(1, 13),
(1, 14),
(1, 22),
(1, 23),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 2),
(1, 8),
(1, 7),
(1, 20),
(1, 21),
(3, 33),
(3, 34),
(3, 35),
(3, 36),
(3, 37),
(3, 26),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(3, 46),
(3, 47),
(3, 48),
(3, 50),
(3, 51),
(3, 53),
(3, 54),
(3, 55),
(3, 56),
(3, 57),
(3, 59),
(3, 60),
(3, 61),
(3, 62),
(3, 63),
(3, 64),
(3, 65),
(3, 66),
(3, 69),
(3, 70),
(3, 72),
(3, 73),
(3, 76),
(3, 77),
(3, 78),
(3, 79),
(3, 81),
(3, 82),
(3, 83),
(3, 84),
(3, 87),
(3, 88),
(3, 89),
(3, 92),
(3, 93),
(3, 95),
(3, 90),
(2, 85),
(2, 74),
(2, 53),
(2, 54),
(2, 59),
(2, 60),
(2, 65),
(2, 69),
(2, 70),
(2, 48),
(3, 97),
(3, 98),
(2, 99),
(3, 104),
(3, 103),
(3, 101),
(3, 102),
(3, 105),
(2, 101),
(2, 104),
(3, 106),
(2, 106),
(2, 107),
(3, 108),
(2, 108),
(3, 109),
(2, 109),
(2, 110),
(3, 111),
(3, 112),
(2, 111),
(3, 113),
(3, 115),
(3, 116),
(3, 117),
(3, 118),
(3, 71),
(1, 70),
(1, 102),
(1, 60),
(1, 54),
(2, 115),
(2, 81),
(3, 67);

-- --------------------------------------------------------

--
-- Table structure for table `systemrole_menu`
--

CREATE TABLE `systemrole_menu` (
  `systemRoleId` int(11) NOT NULL,
  `systemMenuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `systemrole_menu`
--

INSERT INTO `systemrole_menu` (`systemRoleId`, `systemMenuId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(1, 6),
(3, 51),
(3, 17),
(3, 18),
(3, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminId` (`systemAdminId`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `couponcode`
--
ALTER TABLE `couponcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD UNIQUE KEY `filename` (`filename`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderStatusId` (`orderStatusId`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productCategoryId` (`productCategoryId`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `productreview`
--
ALTER TABLE `productreview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD KEY `productId` (`productId`),
  ADD KEY `imageId` (`imageId`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD KEY `productId` (`productId`),
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systemadmin`
--
ALTER TABLE `systemadmin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `systemRoleId` (`systemRoleId`);

--
-- Indexes for table `systemfunction`
--
ALTER TABLE `systemfunction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `systemmenu`
--
ALTER TABLE `systemmenu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `routeName` (`routeName`);

--
-- Indexes for table `systemrole`
--
ALTER TABLE `systemrole`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `systemrole_function`
--
ALTER TABLE `systemrole_function`
  ADD KEY `systemRoleId` (`systemRoleId`),
  ADD KEY `systemFunctionId` (`systemFunctionId`);

--
-- Indexes for table `systemrole_menu`
--
ALTER TABLE `systemrole_menu`
  ADD KEY `systemRoleId` (`systemRoleId`),
  ADD KEY `systemMenuId` (`systemMenuId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `couponcode`
--
ALTER TABLE `couponcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `productreview`
--
ALTER TABLE `productreview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `systemadmin`
--
ALTER TABLE `systemadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `systemfunction`
--
ALTER TABLE `systemfunction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `systemmenu`
--
ALTER TABLE `systemmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `systemrole`
--
ALTER TABLE `systemrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`systemAdminId`) REFERENCES `systemadmin` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`orderStatusId`) REFERENCES `orderstatus` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`productCategoryId`) REFERENCES `productcategory` (`id`);

--
-- Constraints for table `productreview`
--
ALTER TABLE `productreview`
  ADD CONSTRAINT `productreview_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_image_ibfk_2` FOREIGN KEY (`imageId`) REFERENCES `image` (`id`);

--
-- Constraints for table `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `product_order_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_order_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`);

--
-- Constraints for table `systemadmin`
--
ALTER TABLE `systemadmin`
  ADD CONSTRAINT `systemadmin_ibfk_1` FOREIGN KEY (`systemRoleId`) REFERENCES `systemrole` (`id`);

--
-- Constraints for table `systemrole_function`
--
ALTER TABLE `systemrole_function`
  ADD CONSTRAINT `systemrole_function_ibfk_1` FOREIGN KEY (`systemRoleId`) REFERENCES `systemrole` (`id`),
  ADD CONSTRAINT `systemrole_function_ibfk_2` FOREIGN KEY (`systemFunctionId`) REFERENCES `systemfunction` (`id`);

--
-- Constraints for table `systemrole_menu`
--
ALTER TABLE `systemrole_menu`
  ADD CONSTRAINT `systemrole_menu_ibfk_1` FOREIGN KEY (`systemRoleId`) REFERENCES `systemrole` (`id`),
  ADD CONSTRAINT `systemrole_menu_ibfk_2` FOREIGN KEY (`systemMenuId`) REFERENCES `systemmenu` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

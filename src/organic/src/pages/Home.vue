<template>
   <div class="home">
      <!-- top -->
      <section class="top-section" @mousemove="handleMoveEffectTopImage">
         <div class="grid wide">
            <div class="row">
               <div class="col l-6 m-8 s-12">
                  <div class="top-section-txt">
                     <p class="top-section-title">100% Thực phẩm hữu cơ</p>
                     <h1 class="top-section-heading">
                        Rau củ hữu cơ rất tốt cho
                        <span>sức khỏe</span>
                     </h1>
                     <p class="top-section-para">
                        Hãy cùng chúng tôi xây dựng một bầu khí quyển trong
                        xanh, một hệ sinh thái không có ô nhiễm, và cả sức khỏe
                        của bạn.
                     </p>
                     <div class="top-section-btn-wrap">
                        <router-link
                           :to="{
                              name: 'shop',
                           }"
                        >
                           <button-v-2>
                              Cửa hàng
                              <i class="fa-solid fa-arrow-right"></i>
                           </button-v-2>
                        </router-link>
                     </div>
                  </div>
               </div>
               <div class="col l-6 m-0 s-0">
                  <div class="top-section-img">
                     <img
                        src="@/assets/images/home/img_top.png"
                        alt="image"
                        ref="homeTopImageNode"
                     />
                  </div>
               </div>
            </div>
         </div>
      </section>
      <div class="bg-wrapper">
         <!-- icon -->
         <section class="icon-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-3 m-6 s-12">
                     <div class="icon-section-item">
                        <div class="icon-section-item-img">
                           <svg
                              version="1.0"
                              xmlns="http://www.w3.org/2000/svg"
                              width="438.000000pt"
                              height="438.000000pt"
                              viewBox="0 0 438.000000 438.000000"
                              preserveAspectRatio="xMidYMid meet"
                              style="fill: #d8ecbd"
                           >
                              <g
                                 transform="translate(0.000000,438.000000) scale(0.100000,-0.100000)"
                                 stroke="none"
                              >
                                 <path
                                    d="M1903 4368 c3 -17 -44 -25 -146 -27 -49 0 -97 -6 -109 -12 -11 -6 -52 -15 -92 -19 -84 -10 -169 -27 -211 -42 -16 -6 -48 -13 -70 -16 -22 -2 -49 -11 -60 -18 -11 -8 -33 -14 -50 -14 -16 0 -39 -7 -49 -15 -11 -8 -29 -15 -40 -15 -12 0 -30 -7 -40 -15 -11 -8 -28 -15 -39 -15 -10 0 -31 -6 -45 -14 -26 -14 -141 -67 -172 -80 -8 -3 -28 -15 -45 -25 -16 -11 -48 -29 -69 -41 -132 -72 -389 -332 -435 -440 -11 -25 -16 -35 -39 -75 -7 -11 -15 -27 -18 -35 -3 -8 -12 -28 -20 -43 -7 -16 -14 -38 -14 -50 0 -12 -7 -31 -15 -41 -8 -11 -15 -34 -15 -50 -1 -17 -7 -42 -15 -56 -8 -14 -14 -41 -15 -61 0 -20 -7 -56 -15 -79 -8 -23 -15 -70 -15 -104 0 -33 -5 -79 -11 -101 -6 -22 -15 -146 -22 -275 -24 -517 -8 -960 44 -1165 6 -22 14 -58 19 -80 16 -73 40 -149 50 -159 5 -5 10 -18 10 -27 0 -15 15 -52 42 -99 4 -8 11 -22 14 -30 12 -31 15 -36 34 -65 11 -16 23 -37 27 -45 34 -75 257 -311 378 -401 65 -48 191 -132 215 -143 8 -3 29 -15 45 -26 28 -18 35 -22 68 -35 6 -3 20 -9 29 -15 10 -5 26 -15 35 -20 10 -6 25 -13 33 -16 8 -3 30 -12 48 -20 17 -8 49 -21 70 -30 20 -9 50 -23 65 -30 16 -8 38 -14 50 -14 12 0 31 -7 41 -15 11 -8 29 -15 41 -15 12 0 30 -7 41 -15 10 -8 33 -15 49 -15 17 0 41 -7 55 -15 14 -8 41 -15 60 -15 19 0 46 -7 60 -15 14 -8 43 -14 65 -15 22 0 60 -6 85 -14 59 -19 261 -36 422 -36 135 0 244 12 318 36 25 8 57 14 71 14 15 0 32 7 39 15 7 8 20 15 29 15 10 0 26 7 37 15 10 8 24 15 31 15 17 0 106 55 185 115 72 53 495 474 623 620 44 50 93 104 110 121 100 103 172 182 217 237 28 34 56 67 62 72 7 6 41 48 76 95 35 47 70 89 77 93 7 4 13 13 13 19 0 5 14 27 30 48 17 21 30 44 30 51 0 7 6 20 14 28 22 25 106 192 106 211 0 10 7 23 15 30 8 7 15 23 15 37 0 13 5 34 12 46 7 12 15 49 19 82 4 35 14 64 23 71 22 16 24 224 2 224 -16 0 -26 30 -26 85 0 22 -7 49 -15 59 -8 11 -15 30 -15 42 0 12 -6 35 -14 51 -7 15 -20 44 -29 63 -14 33 -29 65 -89 180 -13 25 -28 51 -35 58 -6 6 -15 21 -18 32 -3 11 -11 20 -16 20 -5 0 -9 7 -9 15 0 8 -5 15 -10 15 -6 0 -13 8 -17 18 -3 9 -19 33 -35 53 -15 20 -28 41 -28 45 0 5 -14 25 -31 44 -16 19 -56 69 -88 110 -33 41 -72 89 -88 105 -16 17 -53 59 -82 94 -29 35 -58 70 -64 76 -7 7 -64 68 -127 136 -197 213 -547 549 -572 549 -4 0 -13 6 -20 13 -18 16 -48 35 -75 46 -11 6 -24 15 -28 20 -3 6 -14 11 -24 11 -10 0 -24 7 -31 15 -7 8 -22 15 -34 15 -11 0 -30 7 -40 15 -11 8 -33 15 -48 15 -16 0 -41 6 -56 14 -15 7 -67 16 -116 18 -68 3 -92 9 -101 21 -11 15 -39 17 -249 17 -178 0 -235 -3 -233 -12z"
                                 ></path>
                              </g>
                           </svg>
                           <img
                              src="@/assets/images/home/icon_1.png"
                              alt="icon"
                           />
                        </div>
                        <h5 class="icon-section-item-heading">
                           Bổ sung <span>dinh dưỡng</span>
                        </h5>
                        <p class="icon-section-item-desc">
                           Dinh dưỡng tươi hoàn toàn tự nhiên.
                        </p>
                        <div class="icon-section-item-btn-wrap">
                           <button-v-1 @click="handleRedirectToAboutPage"
                              >Đọc thêm</button-v-1
                           >
                        </div>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-12">
                     <div class="icon-section-item">
                        <div class="icon-section-item-img">
                           <svg
                              version="1.0"
                              xmlns="http://www.w3.org/2000/svg"
                              width="438.000000pt"
                              height="438.000000pt"
                              viewBox="0 0 438.000000 438.000000"
                              preserveAspectRatio="xMidYMid meet"
                              style="fill: #f4e2bb"
                           >
                              <g
                                 transform="translate(0.000000,438.000000) scale(0.100000,-0.100000)"
                                 stroke="none"
                              >
                                 <path
                                    d="M1903 4368 c3 -17 -44 -25 -146 -27 -49 0 -97 -6 -109 -12 -11 -6 -52 -15 -92 -19 -84 -10 -169 -27 -211 -42 -16 -6 -48 -13 -70 -16 -22 -2 -49 -11 -60 -18 -11 -8 -33 -14 -50 -14 -16 0 -39 -7 -49 -15 -11 -8 -29 -15 -40 -15 -12 0 -30 -7 -40 -15 -11 -8 -28 -15 -39 -15 -10 0 -31 -6 -45 -14 -26 -14 -141 -67 -172 -80 -8 -3 -28 -15 -45 -25 -16 -11 -48 -29 -69 -41 -132 -72 -389 -332 -435 -440 -11 -25 -16 -35 -39 -75 -7 -11 -15 -27 -18 -35 -3 -8 -12 -28 -20 -43 -7 -16 -14 -38 -14 -50 0 -12 -7 -31 -15 -41 -8 -11 -15 -34 -15 -50 -1 -17 -7 -42 -15 -56 -8 -14 -14 -41 -15 -61 0 -20 -7 -56 -15 -79 -8 -23 -15 -70 -15 -104 0 -33 -5 -79 -11 -101 -6 -22 -15 -146 -22 -275 -24 -517 -8 -960 44 -1165 6 -22 14 -58 19 -80 16 -73 40 -149 50 -159 5 -5 10 -18 10 -27 0 -15 15 -52 42 -99 4 -8 11 -22 14 -30 12 -31 15 -36 34 -65 11 -16 23 -37 27 -45 34 -75 257 -311 378 -401 65 -48 191 -132 215 -143 8 -3 29 -15 45 -26 28 -18 35 -22 68 -35 6 -3 20 -9 29 -15 10 -5 26 -15 35 -20 10 -6 25 -13 33 -16 8 -3 30 -12 48 -20 17 -8 49 -21 70 -30 20 -9 50 -23 65 -30 16 -8 38 -14 50 -14 12 0 31 -7 41 -15 11 -8 29 -15 41 -15 12 0 30 -7 41 -15 10 -8 33 -15 49 -15 17 0 41 -7 55 -15 14 -8 41 -15 60 -15 19 0 46 -7 60 -15 14 -8 43 -14 65 -15 22 0 60 -6 85 -14 59 -19 261 -36 422 -36 135 0 244 12 318 36 25 8 57 14 71 14 15 0 32 7 39 15 7 8 20 15 29 15 10 0 26 7 37 15 10 8 24 15 31 15 17 0 106 55 185 115 72 53 495 474 623 620 44 50 93 104 110 121 100 103 172 182 217 237 28 34 56 67 62 72 7 6 41 48 76 95 35 47 70 89 77 93 7 4 13 13 13 19 0 5 14 27 30 48 17 21 30 44 30 51 0 7 6 20 14 28 22 25 106 192 106 211 0 10 7 23 15 30 8 7 15 23 15 37 0 13 5 34 12 46 7 12 15 49 19 82 4 35 14 64 23 71 22 16 24 224 2 224 -16 0 -26 30 -26 85 0 22 -7 49 -15 59 -8 11 -15 30 -15 42 0 12 -6 35 -14 51 -7 15 -20 44 -29 63 -14 33 -29 65 -89 180 -13 25 -28 51 -35 58 -6 6 -15 21 -18 32 -3 11 -11 20 -16 20 -5 0 -9 7 -9 15 0 8 -5 15 -10 15 -6 0 -13 8 -17 18 -3 9 -19 33 -35 53 -15 20 -28 41 -28 45 0 5 -14 25 -31 44 -16 19 -56 69 -88 110 -33 41 -72 89 -88 105 -16 17 -53 59 -82 94 -29 35 -58 70 -64 76 -7 7 -64 68 -127 136 -197 213 -547 549 -572 549 -4 0 -13 6 -20 13 -18 16 -48 35 -75 46 -11 6 -24 15 -28 20 -3 6 -14 11 -24 11 -10 0 -24 7 -31 15 -7 8 -22 15 -34 15 -11 0 -30 7 -40 15 -11 8 -33 15 -48 15 -16 0 -41 6 -56 14 -15 7 -67 16 -116 18 -68 3 -92 9 -101 21 -11 15 -39 17 -249 17 -178 0 -235 -3 -233 -12z"
                                 ></path>
                              </g>
                           </svg>
                           <img
                              src="@/assets/images/home/icon_2.png"
                              alt="icon"
                           />
                        </div>
                        <h5 class="icon-section-item-heading">
                           100% <span>hữu cơ</span>
                        </h5>
                        <p class="icon-section-item-desc">
                           Sản phẩm của chúng tôi hoàn toàn là sản phẩm hữu cơ.
                        </p>
                        <div class="icon-section-item-btn-wrap">
                           <button-v-1 @click="handleRedirectToAboutPage"
                              >Đọc thêm</button-v-1
                           >
                        </div>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-12">
                     <div class="icon-section-item">
                        <div class="icon-section-item-img">
                           <svg
                              version="1.0"
                              xmlns="http://www.w3.org/2000/svg"
                              width="438.000000pt"
                              height="438.000000pt"
                              viewBox="0 0 438.000000 438.000000"
                              preserveAspectRatio="xMidYMid meet"
                              style="fill: #fcc5b7"
                           >
                              <g
                                 transform="translate(0.000000,438.000000) scale(0.100000,-0.100000)"
                                 stroke="none"
                              >
                                 <path
                                    d="M1903 4368 c3 -17 -44 -25 -146 -27 -49 0 -97 -6 -109 -12 -11 -6 -52 -15 -92 -19 -84 -10 -169 -27 -211 -42 -16 -6 -48 -13 -70 -16 -22 -2 -49 -11 -60 -18 -11 -8 -33 -14 -50 -14 -16 0 -39 -7 -49 -15 -11 -8 -29 -15 -40 -15 -12 0 -30 -7 -40 -15 -11 -8 -28 -15 -39 -15 -10 0 -31 -6 -45 -14 -26 -14 -141 -67 -172 -80 -8 -3 -28 -15 -45 -25 -16 -11 -48 -29 -69 -41 -132 -72 -389 -332 -435 -440 -11 -25 -16 -35 -39 -75 -7 -11 -15 -27 -18 -35 -3 -8 -12 -28 -20 -43 -7 -16 -14 -38 -14 -50 0 -12 -7 -31 -15 -41 -8 -11 -15 -34 -15 -50 -1 -17 -7 -42 -15 -56 -8 -14 -14 -41 -15 -61 0 -20 -7 -56 -15 -79 -8 -23 -15 -70 -15 -104 0 -33 -5 -79 -11 -101 -6 -22 -15 -146 -22 -275 -24 -517 -8 -960 44 -1165 6 -22 14 -58 19 -80 16 -73 40 -149 50 -159 5 -5 10 -18 10 -27 0 -15 15 -52 42 -99 4 -8 11 -22 14 -30 12 -31 15 -36 34 -65 11 -16 23 -37 27 -45 34 -75 257 -311 378 -401 65 -48 191 -132 215 -143 8 -3 29 -15 45 -26 28 -18 35 -22 68 -35 6 -3 20 -9 29 -15 10 -5 26 -15 35 -20 10 -6 25 -13 33 -16 8 -3 30 -12 48 -20 17 -8 49 -21 70 -30 20 -9 50 -23 65 -30 16 -8 38 -14 50 -14 12 0 31 -7 41 -15 11 -8 29 -15 41 -15 12 0 30 -7 41 -15 10 -8 33 -15 49 -15 17 0 41 -7 55 -15 14 -8 41 -15 60 -15 19 0 46 -7 60 -15 14 -8 43 -14 65 -15 22 0 60 -6 85 -14 59 -19 261 -36 422 -36 135 0 244 12 318 36 25 8 57 14 71 14 15 0 32 7 39 15 7 8 20 15 29 15 10 0 26 7 37 15 10 8 24 15 31 15 17 0 106 55 185 115 72 53 495 474 623 620 44 50 93 104 110 121 100 103 172 182 217 237 28 34 56 67 62 72 7 6 41 48 76 95 35 47 70 89 77 93 7 4 13 13 13 19 0 5 14 27 30 48 17 21 30 44 30 51 0 7 6 20 14 28 22 25 106 192 106 211 0 10 7 23 15 30 8 7 15 23 15 37 0 13 5 34 12 46 7 12 15 49 19 82 4 35 14 64 23 71 22 16 24 224 2 224 -16 0 -26 30 -26 85 0 22 -7 49 -15 59 -8 11 -15 30 -15 42 0 12 -6 35 -14 51 -7 15 -20 44 -29 63 -14 33 -29 65 -89 180 -13 25 -28 51 -35 58 -6 6 -15 21 -18 32 -3 11 -11 20 -16 20 -5 0 -9 7 -9 15 0 8 -5 15 -10 15 -6 0 -13 8 -17 18 -3 9 -19 33 -35 53 -15 20 -28 41 -28 45 0 5 -14 25 -31 44 -16 19 -56 69 -88 110 -33 41 -72 89 -88 105 -16 17 -53 59 -82 94 -29 35 -58 70 -64 76 -7 7 -64 68 -127 136 -197 213 -547 549 -572 549 -4 0 -13 6 -20 13 -18 16 -48 35 -75 46 -11 6 -24 15 -28 20 -3 6 -14 11 -24 11 -10 0 -24 7 -31 15 -7 8 -22 15 -34 15 -11 0 -30 7 -40 15 -11 8 -33 15 -48 15 -16 0 -41 6 -56 14 -15 7 -67 16 -116 18 -68 3 -92 9 -101 21 -11 15 -39 17 -249 17 -178 0 -235 -3 -233 -12z"
                                 ></path>
                              </g>
                           </svg>
                           <img
                              src="@/assets/images/home/icon_3.png"
                              alt="icon"
                           />
                        </div>
                        <h5 class="icon-section-item-heading">
                           Chất lượng <span>cao</span>
                        </h5>
                        <p class="icon-section-item-desc">
                           Tất cả sản phẩm đều đảm bảo chất lượng tốt nhất.
                        </p>
                        <div class="icon-section-item-btn-wrap">
                           <button-v-1 @click="handleRedirectToAboutPage"
                              >Đọc thêm</button-v-1
                           >
                        </div>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-12">
                     <div class="icon-section-item">
                        <div class="icon-section-item-img">
                           <svg
                              version="1.0"
                              xmlns="http://www.w3.org/2000/svg"
                              width="438.000000pt"
                              height="438.000000pt"
                              viewBox="0 0 438.000000 438.000000"
                              preserveAspectRatio="xMidYMid meet"
                              style="fill: #ebddd5"
                           >
                              <g
                                 transform="translate(0.000000,438.000000) scale(0.100000,-0.100000)"
                                 stroke="none"
                              >
                                 <path
                                    d="M1903 4368 c3 -17 -44 -25 -146 -27 -49 0 -97 -6 -109 -12 -11 -6 -52 -15 -92 -19 -84 -10 -169 -27 -211 -42 -16 -6 -48 -13 -70 -16 -22 -2 -49 -11 -60 -18 -11 -8 -33 -14 -50 -14 -16 0 -39 -7 -49 -15 -11 -8 -29 -15 -40 -15 -12 0 -30 -7 -40 -15 -11 -8 -28 -15 -39 -15 -10 0 -31 -6 -45 -14 -26 -14 -141 -67 -172 -80 -8 -3 -28 -15 -45 -25 -16 -11 -48 -29 -69 -41 -132 -72 -389 -332 -435 -440 -11 -25 -16 -35 -39 -75 -7 -11 -15 -27 -18 -35 -3 -8 -12 -28 -20 -43 -7 -16 -14 -38 -14 -50 0 -12 -7 -31 -15 -41 -8 -11 -15 -34 -15 -50 -1 -17 -7 -42 -15 -56 -8 -14 -14 -41 -15 -61 0 -20 -7 -56 -15 -79 -8 -23 -15 -70 -15 -104 0 -33 -5 -79 -11 -101 -6 -22 -15 -146 -22 -275 -24 -517 -8 -960 44 -1165 6 -22 14 -58 19 -80 16 -73 40 -149 50 -159 5 -5 10 -18 10 -27 0 -15 15 -52 42 -99 4 -8 11 -22 14 -30 12 -31 15 -36 34 -65 11 -16 23 -37 27 -45 34 -75 257 -311 378 -401 65 -48 191 -132 215 -143 8 -3 29 -15 45 -26 28 -18 35 -22 68 -35 6 -3 20 -9 29 -15 10 -5 26 -15 35 -20 10 -6 25 -13 33 -16 8 -3 30 -12 48 -20 17 -8 49 -21 70 -30 20 -9 50 -23 65 -30 16 -8 38 -14 50 -14 12 0 31 -7 41 -15 11 -8 29 -15 41 -15 12 0 30 -7 41 -15 10 -8 33 -15 49 -15 17 0 41 -7 55 -15 14 -8 41 -15 60 -15 19 0 46 -7 60 -15 14 -8 43 -14 65 -15 22 0 60 -6 85 -14 59 -19 261 -36 422 -36 135 0 244 12 318 36 25 8 57 14 71 14 15 0 32 7 39 15 7 8 20 15 29 15 10 0 26 7 37 15 10 8 24 15 31 15 17 0 106 55 185 115 72 53 495 474 623 620 44 50 93 104 110 121 100 103 172 182 217 237 28 34 56 67 62 72 7 6 41 48 76 95 35 47 70 89 77 93 7 4 13 13 13 19 0 5 14 27 30 48 17 21 30 44 30 51 0 7 6 20 14 28 22 25 106 192 106 211 0 10 7 23 15 30 8 7 15 23 15 37 0 13 5 34 12 46 7 12 15 49 19 82 4 35 14 64 23 71 22 16 24 224 2 224 -16 0 -26 30 -26 85 0 22 -7 49 -15 59 -8 11 -15 30 -15 42 0 12 -6 35 -14 51 -7 15 -20 44 -29 63 -14 33 -29 65 -89 180 -13 25 -28 51 -35 58 -6 6 -15 21 -18 32 -3 11 -11 20 -16 20 -5 0 -9 7 -9 15 0 8 -5 15 -10 15 -6 0 -13 8 -17 18 -3 9 -19 33 -35 53 -15 20 -28 41 -28 45 0 5 -14 25 -31 44 -16 19 -56 69 -88 110 -33 41 -72 89 -88 105 -16 17 -53 59 -82 94 -29 35 -58 70 -64 76 -7 7 -64 68 -127 136 -197 213 -547 549 -572 549 -4 0 -13 6 -20 13 -18 16 -48 35 -75 46 -11 6 -24 15 -28 20 -3 6 -14 11 -24 11 -10 0 -24 7 -31 15 -7 8 -22 15 -34 15 -11 0 -30 7 -40 15 -11 8 -33 15 -48 15 -16 0 -41 6 -56 14 -15 7 -67 16 -116 18 -68 3 -92 9 -101 21 -11 15 -39 17 -249 17 -178 0 -235 -3 -233 -12z"
                                 ></path>
                              </g>
                           </svg>
                           <img
                              src="@/assets/images/home/icon_4.png"
                              alt="icon"
                           />
                        </div>
                        <h5 class="icon-section-item-heading">
                           100% <span>tự nhiên</span>
                        </h5>
                        <p class="icon-section-item-desc">
                           Sản phẩm hoàn toàn được trồng và nuôi tự nhiên
                        </p>
                        <div class="icon-section-item-btn-wrap">
                           <button-v-1 @click="handleRedirectToAboutPage"
                              >Đọc thêm</button-v-1
                           >
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- about -->
         <section class="about-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-7 m-12 s-12">
                     <div class="about-section-img">
                        <img
                           src="@/assets/images/home/about_bg.png"
                           alt="image"
                        />
                     </div>
                  </div>
                  <div class="col l-5 m-12 s-12">
                     <div class="about-section-txt">
                        <p class="about-section-top">
                           CHỈ TỪ
                           <span class="primary-text">
                              {{ toVND(59000) }}
                           </span>
                        </p>
                        <h5 class="about-section-heading">
                           <strong>Tươi &amp; An toàn</strong>
                           Thực phẩm hữu cơ
                        </h5>
                        <p class="about-section-para">
                           Hãy cùng chúng tôi xây dựng một bầu khí quyển trong
                           xanh, một hệ sinh thái không có ô nhiễm, và cả sức
                           khỏe của bạn.
                        </p>
                        <ul class="about-section-feature-list">
                           <li class="about-section-feature-item">
                              <i class="fa-solid fa-circle-check"></i>
                              Sản phẩm tự nhiên
                           </li>
                           <li class="about-section-feature-item">
                              <i class="fa-solid fa-circle-check"></i>
                              Thực phẩm được kiểm nghiệm an toàn
                           </li>
                        </ul>
                        <button-v-2 @click="handleRedirectToShopPage">
                           Cửa hàng
                           <i class="fa-solid fa-arrow-right"></i>
                        </button-v-2>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- offer -->
         <section class="offer-section">
            <div class="grid wide">
               <div class="row offer-section-wrap">
                  <div class="col l-6 m-9 s-12">
                     <div class="offer-section-txt">
                        <h5 class="offer-section-heading">
                           Việt quất <span>&amp;</span> Hạt
                        </h5>
                        <p class="offer-section-price">{{ toVND(280000) }}</p>
                        <p class="offer-section-para">
                           Việt quất (blueberry) là loại quả nổi tiếng khắp thế
                           giới bởi hương vị thơm ngon cùng giá trị dinh dưỡng
                           mà loại quả này mang lại.
                        </p>
                        <div class="offer-section-timeout">
                           <div class="offer-section-timeout-title">
                              NHẬN ƯU ĐÃI NGAY
                           </div>
                           <p class="offer-section-timeout-end-title">
                              Kết thúc sau
                           </p>
                           <ul class="offer-section-timeout-list">
                              <li class="offer-section-timeout-item">
                                 <div class="offer-section-timeout-item-time">
                                    {{ secondsToDhms(saleTime).d }}
                                 </div>
                                 <div class="offer-section-timeout-item-label">
                                    ngày
                                 </div>
                              </li>
                              <li class="offer-section-timeout-item">
                                 <div class="offer-section-timeout-item-time">
                                    {{ secondsToDhms(saleTime).h }}
                                 </div>
                                 <div class="offer-section-timeout-item-label">
                                    giờ
                                 </div>
                              </li>
                              <li class="offer-section-timeout-item">
                                 <div class="offer-section-timeout-item-time">
                                    {{ secondsToDhms(saleTime).m }}
                                 </div>
                                 <div class="offer-section-timeout-item-label">
                                    phút
                                 </div>
                              </li>
                              <li class="offer-section-timeout-item">
                                 <div class="offer-section-timeout-item-time">
                                    {{ secondsToDhms(saleTime).s }}
                                 </div>
                                 <div class="offer-section-timeout-item-label">
                                    giây
                                 </div>
                              </li>
                           </ul>
                        </div>
                        <button-v-2 @click="handleRedirectToShopPage">
                           Mua ngay
                           <i class="fa-solid fa-arrow-right"></i>
                        </button-v-2>
                     </div>
                  </div>
                  <div class="col l-6 m-3 s-0"></div>
               </div>
            </div>
         </section>
         <!-- nutrition -->
         <section class="nutrition-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-12 m-12 s-12">
                     <heading-section>
                        <template #prefix>Bổ sung</template>
                        <template #strong> Dinh dưỡng</template>
                     </heading-section>
                  </div>
                  <div class="col l-5 m-12 s-12">
                     <div class="nutrition-section-item">
                        <img
                           src="@/assets/images/home/nutrition_1.jpg"
                           alt="image"
                        />
                        <p class="nutrition-section-item-1">
                           <strong>Dinh dưỡng</strong> hữu cơ
                        </p>
                     </div>
                  </div>
                  <div class="col l-7 m-12 s-12">
                     <div class="nutrition-section-item">
                        <img
                           src="@/assets/images/home/nutrition_2.jpg"
                           alt="image"
                        />
                        <p class="nutrition-section-item-2">
                           <strong>Cung cấp</strong> đạm
                        </p>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- slider -->
         <section class="slider-section">
            <div class="grid wide">
               <swiper
                  :speed="600"
                  :slides-per-view="1"
                  :spaceBetween="30"
                  :centeredSlides="true"
                  :loop="true"
                  :autoplay="{
                     delay: 2000,
                     disableOnInteraction: false,
                     pauseOnMouseEnter: false,
                  }"
                  :modules="modulesSwiper"
               >
                  <swiper-slide>
                     <div class="slider-section-product">
                        <div class="row">
                           <div class="col- l-5 m-5 s-12">
                              <div class="slider-section-product-txt">
                                 <div class="slider-section-product-price">
                                    Chỉ từ {{ toVND(100000) }}
                                 </div>
                                 <h5 class="slider-section-product-name">
                                    <strong>Bơ</strong> tươi
                                 </h5>
                                 <p class="slider-section-product-desc">
                                    Luôn luôn tươi ngon
                                    <br />
                                    100% hữu cơ
                                 </p>
                                 <button-v-2 @click="handleRedirectToShopPage">
                                    Xem thêm
                                    <i class="fa-solid fa-arrow-right"></i>
                                 </button-v-2>
                              </div>
                           </div>
                           <div class="col- l-7 m-7 s-12">
                              <div class="slider-section-product-img">
                                 <img
                                    src="@/assets/images/home/slider_1.png"
                                    alt="product image"
                                 />
                              </div>
                           </div>
                        </div>
                     </div>
                  </swiper-slide>
                  <swiper-slide>
                     <div class="slider-section-product">
                        <div class="row">
                           <div class="col- l-5 m-5 s-12">
                              <div class="slider-section-product-txt">
                                 <div class="slider-section-product-price">
                                    Chỉ từ {{ toVND(100000) }}
                                 </div>
                                 <h5 class="slider-section-product-name">
                                    <strong>Bắp cải</strong> tươi
                                 </h5>
                                 <p class="slider-section-product-desc">
                                    Luôn luôn tươi ngon
                                    <br />
                                    100% hữu cơ
                                 </p>
                                 <button-v-2 @click="handleRedirectToShopPage">
                                    Xem thêm
                                    <i class="fa-solid fa-arrow-right"></i>
                                 </button-v-2>
                              </div>
                           </div>
                           <div class="col- l-7 m-7 s-12">
                              <div class="slider-section-product-img">
                                 <img
                                    src="@/assets/images/home/slider_2.png"
                                    alt="product image"
                                 />
                              </div>
                           </div>
                        </div>
                     </div>
                  </swiper-slide>
                  <swiper-slide>
                     <div class="slider-section-product">
                        <div class="row">
                           <div class="col- l-5 m-5 s-12">
                              <div class="slider-section-product-txt">
                                 <div class="slider-section-product-price">
                                    Chỉ từ {{ toVND(100000) }}
                                 </div>
                                 <h5 class="slider-section-product-name">
                                    <strong>Hành tây</strong> tươi
                                 </h5>
                                 <p class="slider-section-product-desc">
                                    Luôn luôn tươi ngon
                                    <br />
                                    100% hữu cơ
                                 </p>
                                 <button-v-2 @click="handleRedirectToShopPage">
                                    Xem thêm
                                    <i class="fa-solid fa-arrow-right"></i>
                                 </button-v-2>
                              </div>
                           </div>
                           <div class="col- l-7 m-7 s-12">
                              <div class="slider-section-product-img">
                                 <img
                                    src="@/assets/images/home/slider_3.png"
                                    alt="product image"
                                 />
                              </div>
                           </div>
                        </div>
                     </div>
                  </swiper-slide>
                  <swiper-slide>
                     <div class="slider-section-product">
                        <div class="row">
                           <div class="col- l-5 m-5 s-12">
                              <div class="slider-section-product-txt">
                                 <div class="slider-section-product-price">
                                    Chỉ từ {{ toVND(100000) }}
                                 </div>
                                 <h5 class="slider-section-product-name">
                                    <strong>Cà chua</strong> tươi
                                 </h5>
                                 <p class="slider-section-product-desc">
                                    Luôn luôn tươi ngon
                                    <br />
                                    100% hữu cơ
                                 </p>
                                 <button-v-2 @click="handleRedirectToShopPage">
                                    Xem thêm
                                    <i class="fa-solid fa-arrow-right"></i>
                                 </button-v-2>
                              </div>
                           </div>
                           <div class="col- l-7 m-7 s-12">
                              <div class="slider-section-product-img">
                                 <img
                                    src="@/assets/images/home/slider_4.png"
                                    alt="product image"
                                 />
                              </div>
                           </div>
                        </div>
                     </div>
                  </swiper-slide>
               </swiper>
            </div>
         </section>
         <!-- product -->
         <section class="product-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-12 m-12 s-12">
                     <heading-section>
                        <template #prefix>Hàng</template>
                        <template #strong> Mới về</template>
                     </heading-section>
                  </div>
                  <div
                     class="col l-6 m-12 s-12"
                     v-for="item in productListIsNew"
                     :key="item.id"
                  >
                     <ProductV1 :product="item" />
                  </div>
               </div>
            </div>
            <button-v-2 @click="handleRedirectToShopPage">
               Xem thêm
               <i class="fa-solid fa-arrow-right"></i>
            </button-v-2>
         </section>
         <!-- statistical -->
         <section class="statistical-section" ref="statisticalSection">
            <Statistical />
         </section>
         <!-- blog -->
         <section class="blog-section">
            <div class="grid wide">
               <div class="row align-start">
                  <div
                     class="col l-3 m-6 s-12"
                     v-for="item in blogList"
                     :key="item.id"
                  >
                     <BlogV1 :blog="item" />
                  </div>
                  <div class="col l-6 m-12 s-12">
                     <div class="blog-section-txt">
                        <heading-section>
                           <template #prefix>Chất lượng </template>
                           <template #strong>Cao</template>
                        </heading-section>
                        <p class="blog-section-para">
                           Hãy cùng chúng tôi xây dựng một bầu khí quyển trong
                           xanh, một hệ sinh thái không có ô nhiễm, và cả sức
                           khỏe của bạn. Chúng tôi luôn lựa chọn những sản phẩm
                           có chất lượng tốt nhất dành cho bạn.
                        </p>
                        <button-v-2 @click="handleRedirectToBlogPage">
                           Xem thêm
                           <i class="fa-solid fa-arrow-right"></i>
                        </button-v-2>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- mail -->
         <section class="mail-section">
            <SubscribeMail />
         </section>
      </div>
   </div>
</template>

<script>
import { ref, computed, onBeforeMount } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";

/* eslint-disable */
import ButtonV1 from "@/components/ButtonV1.vue";
import ButtonV2 from "@/components/ButtonV2.vue";
import HeadingSection from "@/components/HeadingSection.vue";
import Statistical from "@/components/Statistical.vue";
import SubscribeMail from "@/components/SubscribeMail.vue";
import ProductV1 from "@/components/ProductV1.vue";
import BlogV1 from "@/components/BlogV1.vue";

//#region Slider Swiper
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from "swiper/vue";
// import required modules
import { Autoplay } from "swiper";
//#endregion

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

import { toVND } from "@/helpers/functions";

export default {
   name: "HomePage",
   components: {
      ButtonV1,
      ButtonV2,
      HeadingSection,
      Swiper,
      SwiperSlide,
      Statistical,
      SubscribeMail,
      ProductV1,
      BlogV1,
   },
   setup() {
      const store = useStore();
      const router = useRouter();

      const homeTopImageNode = ref(null);
      const saleTime = computed(() => {
         return store.getters.getSaleTime;
      });
      const modulesSwiper = [Autoplay];

      const productListIsNew = ref([]);
      const blogList = ref([]);

      function getProductListIsNew() {
         return API.get(
            apiPath + `/product/get_list.php`,
            {
               limit: 6,
               offset: 0,
               fillType: "isNew",
               fillValue: 1,
            },
            (data) => {
               if (data.code === 1) {
                  // TABLE STATES
                  productListIsNew.value = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
                     originPrice: +item.originPrice,
                     promotionPrice: +item.promotionPrice,
                     averageRating: +item.averageRating,
                     quantityReview: +item.quantityReview,
                  }));
               }
            }
         );
      }

      function getBlogList() {
         return API.get(
            apiPath + `/blog/get_list.php`,
            {
               limit: 2,
               offset: 0,
               reverse: true,
            },
            (data) => {
               if (data.code === 1) {
                  // TABLE STATES
                  blogList.value = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
                  }));
               }
            }
         );
      }

      function getCoords(el) {
         let coords = el.getBoundingClientRect();
         return {
            x: coords.left / 100,
            y: coords.top / 100,
         };
      }

      function secondsToDhms(seconds) {
         seconds = Number(seconds);
         let d = Math.floor(seconds / (3600 * 24));
         let h = Math.floor((seconds % (3600 * 24)) / 3600);
         let m = Math.floor((seconds % 3600) / 60);
         let s = Math.floor(seconds % 60);
         return { d, h, m, s };
      }

      function handleMoveEffectTopImage(e) {
         let mouseX = e.clientX;
         let mouseY = e.clientY;

         const imgNode = homeTopImageNode.value;

         let imgX = mouseX - getCoords(imgNode).x;
         let imgY = mouseY - getCoords(imgNode).y;

         imgNode.style.transform = `
        translateX(-${imgX / 50}px)
        translateY(-${imgY / 50}px)
      `;
      }

      function handleRedirectToAboutPage() {
         router.push({ name: "about" });
      }

      function handleRedirectToShopPage() {
         router.push({ name: "shop", params: { categoryName: "show-all" } });
      }

      function handleRedirectToBlogPage() {
         router.push({ name: "blog" });
      }

      onBeforeMount(() => {
         getProductListIsNew();
         getBlogList();
      });

      return {
         toVND,
         homeTopImageNode,
         saleTime,
         secondsToDhms,
         modulesSwiper,
         productListIsNew,
         blogList,
         handleMoveEffectTopImage,
         handleRedirectToAboutPage,
         handleRedirectToShopPage,
         handleRedirectToBlogPage,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

@keyframes showHomeTopTitle {
   0% {
      opacity: 0;
      top: -100px;
   }
   100% {
      opacity: 1;
      top: 0;
   }
}

@keyframes showHomeTopHeading {
   0% {
      opacity: 0;
      left: -200px;
   }
   100% {
      opacity: 1;
      left: 0;
   }
}

@keyframes showHomeTopPara {
   0% {
      opacity: 0;
      left: -260px;
   }
   100% {
      opacity: 1;
      left: 0;
   }
}

@keyframes showHomeTopBtn {
   0% {
      opacity: 0;
      bottom: -150px;
   }
   100% {
      opacity: 1;
      bottom: 0;
   }
}

@keyframes showHomeTopImg {
   0% {
      opacity: 0;
      transform: scale(0.5);
   }
   100% {
      opacity: 1;
      transform: scale(1);
   }
}

.home {
   background-color: $bodyColor;
}

.top-section {
   background-repeat: no-repeat;
   background-image: url("@/assets/images/home/bg_top.png");
   background-size: cover;
   background-position: left center;
   width: 100%;
   height: 100%;
   opacity: 1;
   visibility: inherit;
   z-index: 20;
   padding: 65px 0 100px;

   .row {
      align-items: center;
   }

   &-title {
      width: 100%;
      height: 62px;
      line-height: 68px;
      text-align: center;
      font-size: 24px;
      font-weight: 600;
      color: #313131;
      display: block;
      background: url("@/assets/images/home/title_bg.png") no-repeat center
         center/cover;
      margin-bottom: 25px;
      position: relative;
      animation: showHomeTopTitle ease-out 2s forwards;
   }

   &-heading {
      font-size: 62px;
      color: white;
      line-height: 1.1;
      font-weight: 800;
      margin-bottom: 25px;
      position: relative;
      animation: showHomeTopHeading ease-out 2s forwards;

      span {
         color: #313131;
      }
   }

   &-para {
      font-size: 22px;
      color: white;
      line-height: 1.3;
      margin-bottom: 25px;
      position: relative;
      animation: showHomeTopPara ease-out 3s forwards;
   }

   &-btn-wrap {
      position: relative;
      animation: showHomeTopBtn ease-out 3.5s forwards;

      .button-v2 {
         background: #313131;
      }
   }

   &-img {
      animation: showHomeTopImg ease 3s forwards;
   }

   @media (max-width: $maxMobile) {
      text-align: center;
      padding: 80px 0 120px;

      &-title {
         height: auto;
         line-height: 50px;
         font-size: 22px;
      }

      &-heading {
         font-size: 46px;
         width: 380px;
         margin: 0 auto 25px;
      }

      &-para {
         font-size: 18px;
         text-align: justify;
      }
   }

   @media (max-width: 400px) {
      padding: 50px 0 80px;

      &-title {
         font-size: 20px;
         margin-bottom: 18px;
      }

      &-heading {
         font-size: 32px;
         width: 250px;
         margin: 0 auto 12px;
      }

      &-para {
         font-size: 18px;
         line-height: 1.2;
         margin-bottom: 18px;
      }
   }
}

.bg-wrapper {
   position: relative;

   background: url("@/assets/images/home/bodybg.png") no-repeat left center
      $bodyColor;
}

.icon-section {
   padding-top: 100px;
   position: relative;
   background: url("@/assets/images/home/icon_bg.png") no-repeat center;

   &-item {
      text-align: center;
      color: $darkTextColor;
      padding: 0 12px;
      margin-bottom: 100px;

      &-img {
         display: flex;
         justify-content: center;
         align-items: center;
         position: relative;
         margin-bottom: 65px;

         svg {
            width: 150px;
            height: auto;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 0;
         }

         img {
            max-width: 85px;
            position: relative;
            z-index: 1;
            left: -8px;
         }
      }

      &-heading {
         font-size: 25px;
         font-weight: 400;
         line-height: 1.2;

         span {
            font-weight: bold;
         }
      }

      &-desc {
         margin: 15px 0;
         font-size: 19px;
         color: #525252;
         line-height: 1.2;
      }

      &-btn-wrap {
         .button-v1 {
            font-size: 14px;
         }
      }
   }
}

.about-section {
   padding: 50px 0;

   &-top {
      font-size: 24px;
      color: $darkTextColor;
      margin-bottom: 20px;

      span {
         font-size: 42px;
         color: $primaryColor;
      }
   }

   &-heading {
      font-size: 42px;
      font-weight: 300;
      line-height: 1.1;
      margin-bottom: 20px;

      strong {
         font-weight: bold;
         display: block;
      }
   }

   &-para {
      color: #828282;
      font-size: 21px;
      line-height: 1.2;
      font-weight: 400;
      margin-bottom: 20px;
   }

   &-feature-list {
      margin-bottom: 30px;
   }

   &-feature-item {
      font-size: 20px;
      font-weight: 600;
      color: #525252;

      & + & {
         margin-top: 16px;
      }

      i {
         margin-right: 10px;
         color: $primaryColor;
      }
   }

   @media (max-width: $maxMobile) {
      padding-top: 0;
      padding-bottom: 50px;

      &-heading {
         font-size: 36px;
      }
   }
}

.offer-section {
   margin-top: 50px;
   padding-bottom: 50px;

   &-wrap {
      position: relative;
      background: url("@/assets/images/home/offer_bg.png") no-repeat center
         center/cover #fff;
      border-radius: 24px;
      margin-left: 0;
      margin-right: 0;
      box-shadow: $cardShadow;
   }

   &-txt {
      padding: 100px 30px 80px 60px;
   }

   &-heading {
      font-size: 50px;
      font-weight: bold;
      color: $darkTextColor;

      span {
         font-weight: 300;
      }
   }

   &-price {
      margin: 16px 0;
      font-size: 20px;
      font-weight: bold;
      color: $primaryColor;
   }

   &-para {
      color: #828282;
      font-size: 20px;
      line-height: 1.2;
   }

   &-timeout {
      padding: 20px 0 40px;

      &-title {
         color: $primaryColor;
         font-weight: bold;
         font-size: 20px;
      }

      &-end-title {
         margin-top: 12px;
      }

      &-list {
         display: flex;
         align-items: flex-start;
      }

      &-item {
         padding-top: 20px;
         text-align: center;

         & + & {
            margin-left: 12px;
         }

         &-time {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #faf6f6;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 10px;
         }

         &-label {
            text-transform: uppercase;
            font-size: 12px;
            color: #525252;
         }
      }
   }

   @media (max-width: $maxMobile) {
      margin-top: 30px;

      &-txt {
         padding: 40px 15px;
      }

      &-heading {
         font-size: 33px;
      }
   }
}

.nutrition-section {
   padding: 76px 0;

   &-item {
      position: relative;
      margin-right: 60px;
      margin-bottom: 24px;

      img {
         border-radius: 20px;
         vertical-align: middle;
         box-shadow: $cardShadow;
      }

      p {
         position: absolute;
         transform: rotate(-90deg);
         font-size: 35px;
         font-weight: 300;

         strong {
            font-weight: 600;
         }
      }

      .nutrition-section-item-1 {
         bottom: 112px;
         right: -158px;
      }

      .nutrition-section-item-2 {
         bottom: 80px;
         right: -125px;
      }
   }

   @media (max-width: $maxMobile) {
      &-item {
         p {
            font-size: 24px;
         }

         .nutrition-section-item-1 {
            bottom: 80px;
            right: -110px;
         }

         .nutrition-section-item-2 {
            bottom: 58px;
            right: -90px;
         }
      }
   }
}

.slider-section {
   padding: 192px 0 115px;
   background: url("@/assets/images/home/slider_bg.png") no-repeat center center;

   &-product {
      .row {
         margin-left: 0;
         margin-right: 0;
         align-items: center;
      }

      &-txt {
         text-align: right;
         padding-right: 80px;
         position: relative;
         top: -30px;
      }

      &-price {
         font-size: 24px;
         color: $primaryColor;
         font-weight: bold;
      }

      &-name {
         font-size: 46px;
         font-weight: 300;
         color: $darkTextColor;
         margin: 14px 0;

         strong {
            font-weight: bold;
         }
      }

      &-desc {
         font-size: 20px;
         color: #828282;
         line-height: 1.2;
         margin-bottom: 28px;
      }

      &-img {
         // max-width: 580px;
      }
   }

   @media (max-width: $maxTablet) {
      padding: 192px 0 115px;

      &-product {
         &-txt {
            top: 0;
            padding-right: 32px;
         }

         &-price {
            font-size: 20px;
         }

         &-name {
            font-size: 42px;
         }

         &-desc {
            font-size: 18px;
            margin-bottom: 26px;
         }
      }
   }

   @media (max-width: $maxMobile) {
      &-product {
         &-txt {
            padding-right: 0;
            text-align: center;
            margin-bottom: 42px;
         }

         &-price {
            font-size: 20px;
         }

         &-name {
            font-size: 36px;
         }

         &-desc {
            font-size: 18px;
            margin-bottom: 26px;
         }

         &-img {
            max-width: 400px;
            margin: 0 auto;
         }
      }
   }
}

.product-section {
   padding: 76px 0;
   background: url("@/assets/images/home/product_bg.png") no-repeat center;

   .row {
      padding-top: 40px;
   }

   .button-v2 {
      margin: 20px auto;
      display: block;
   }
}

.blog-section {
   padding: 120px 0 70px;
   background: url("@/assets/images/home/blog_bg.png") no-repeat center/cover;

   .heading-section {
      margin-bottom: 20px;
   }

   .row {
      align-items: center;
   }

   &-txt {
      text-align: left;
      padding-left: 30px;
   }

   &-para {
      margin: 24px 0 32px;
      font-size: 20px;
      color: #5e5e5e;
      line-height: 1.2;
   }

   @media (max-width: $maxTablet) {
      &-txt {
         padding-left: 0;
      }
   }
}

.mail-section {
   padding: 50px 0 100px;
}
</style>

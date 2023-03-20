<template>
   <div class="page-number">
      <button
         class="page-number-btn page-number-prev-btn"
         @click="handlePrevPage"
      >
         <i class="fa-solid fa-arrow-left"></i>
      </button>
      <ul class="page-number-list">
         <li
            v-for="i in numberOfPage"
            :key="i"
            :class="{
               'page-number-item': true,
               active: i === currentPage,
            }"
            @click="() => handleChoosePage(i)"
         >
            {{ i }}
         </li>
      </ul>
      <button
         class="page-number-btn page-number-next-btn"
         @click="handleNextPage"
      >
         <i class="fa-solid fa-arrow-right"></i>
      </button>
   </div>
</template>
<script>
/* eslint-disable */
export default {
   name: "PageNumberComponent",
   props: {
      numberOfPage: {
         type: Number,
         required: true,
      },
      currentPage: {
         type: Number,
         required: true,
      },
   },
   emits: ["onChoosePage", "onPrevPage", "onNextPage"],
   setup(props, { emit }) {
      function handleChoosePage(pageNumber) {
         emit("onChoosePage", pageNumber);
      }

      function handlePrevPage() {
         emit("onPrevPage");
      }

      function handleNextPage() {
         emit("onNextPage");
      }

      return {
         handleChoosePage,
         handlePrevPage,
         handleNextPage,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.page-number {
   padding-top: 30px;
   display: flex;
   align-items: center;
   justify-content: center;

   &-btn {
      width: 40px;
      height: 40px;
      text-align: center;
      line-height: 43px;
      color: $darkTextColor;
      background-color: #cbcbcb;
      border-radius: 50%;
      transition: all ease 0.4s;
      font-size: 16px;

      &:hover {
         cursor: pointer;
         color: white;
         background-color: $primaryColor;
      }
   }

   &-list {
      display: flex;
      align-items: center;
      padding: 0 40px;
   }

   &-item {
      width: 38px;
      max-width: 100%;
      height: 38px;
      text-align: center;
      line-height: 38px;
      color: $darkTextColor;
      background-color: white;
      border: 1px solid rgb(221, 221, 221);
      border-radius: 50%;
      transition: all ease 0.4s;
      font-size: 16px;
      font-weight: 600;

      &.active,
      &:hover {
         cursor: pointer;
         color: white;
         background-color: $primaryColor;
      }

      & + & {
         margin-left: 10px;
      }
   }

   @media (max-width: $maxMobile) {
      &-list {
         padding: 0 16px;
      }
   }
}
</style>

    <!-- 구성원 추가 모달 -->

    <!-- <script>

          // const openButton = document.getElementsByClassName("modal__button");
          // const modal = document.querySelector(".modal");
          // const openModal =() =>{
          //     modal.classList.remove("hidden");
          // }
          // openButton.addEventListener("click", openModal);
          document.querySelector(".modal__button").addEventListener("click", () => {
          document
          .querySelector(".modal")
          .classList.remove("hidden");
  </script> -->
    <script>
      window.onload = function () {
        function onClick() {
          const modal = document.querySelector(".modal");
          modal.classList.remove("hidden");
        }
        function offClick() {
          const modal = document.querySelector(".modal");
          modal.classList.add("hidden");
        }

        document
          .getElementById("add__member__open")
          .addEventListener("click", onClick);
        document
          .querySelector(".modal__close")
          .addEventListener("click", offClick);
      };
    </script>
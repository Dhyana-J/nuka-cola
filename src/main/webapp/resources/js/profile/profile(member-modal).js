 window.onload = function() {
      
      function onClick() {
          const modal = document.querySelector(".modal");
          modal.classList.remove("hidden");
      }   
      function offClick() {
          const modal = document.querySelector(".modal");
          modal.classList.add("hidden");
      }

      document.getElementById('add__member__open').addEventListener('click', onClick);
      document.querySelector('.modal__close').addEventListener('click', offClick);

      };

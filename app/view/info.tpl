<main class="search-page">




  <div id="upperSection">
    <button id="addEntry">ADD ENTRY</button>
    <div id="editView">
      <div id="editContent">
        <span id="closeX" class="close">&times;</span>
        <p id="editDirections">Please enter the information below to add the celeberity to the database!</p><br>
        <form id="formOrder" >
          <input id="nameSubmit" class="search2" placeholder="NAME" required="required" type="text" name="name"><br>
          <input placeholder="FAITH" type="text" id="faithSubmit" required="required" class="formInput" name="faith"><br>
          <input id="rankSubmit" type="text" class="formInput" required="required" placeholder="RANK" name="rank"><br>
          <input id="homeSubmit" class="search2" placeholder="HOMETOWN" required="required" name="hometown"><br>
          <button id="submitEdit">SUBMIT</button><br>
        </form>
      </div>
    </div>
  </div>
  </br>
  <div id="content">

  </div>

</main>
<script>


    // $("#submitEdit").click(function(e) {
    //   e.preventDefault();
    //   console.log("click");
    //   var name = $("#nameSubmit").val();
    //   var faith = $("#faithSubmit").val();
    //   var rank = $("#rankSubmit").val();
    //   var hometown = $("#homeSubmit").val();
    //
    //   if (name === '' || faith === '' || rank === '' || hometown === '') {
    //     alert("Please fill out all necessary information");
    //   } else {
    //     $.ajax({
    //
    //
    //       url: "<?= BASE_URL ?>/app/controller/postInfo.php",
    //       type: "POST",
    //
    //       data: {
    //         "name": name,
    //         "faith": faith,
    //         "rank": rank,
    //         "hometown": hometown
    //       },
    //       success: function(result) {
    //         var result = $.parseJSON(data);
    //         alert("WE IN HERE");
    //       }
    //
    //
    //
    //     })
    //   }
    // });
    //
    //
    //
    //
    //
    // $("#addEntry").click(function() {
    //   $("#editView").fadeIn(200);
    //
    // });

</script>

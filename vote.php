<?php
session_start();
include("db_connect.php");

// Prevent access if not logged in as voter
if (!isset($_SESSION['RMAQuser_id']) || !isset($_SESSION['RMAQlogged_in']) || $_SESSION['RMAQlogged_in'] !== true) {
    header("Location: index.php");
    exit;
}

// Get the current user's student number
$uid = intval($_SESSION['RMAQuser_id']);
$res = $RMAQconn->query("SELECT username FROM pma_register WHERE id = $uid LIMIT 1");
if (!$res || !($row = $res->fetch_assoc())) {
    header("Location: index.php");
    exit;
}
$voter_id = $row['username'];

// Check if this user already has a vote
$vote_check = $RMAQconn->prepare("SELECT vote_id FROM vote_table WHERE voter_id = ? LIMIT 1");
$vote_check->bind_param("s", $voter_id);
$vote_check->execute();
$vote_check->bind_result($reference_code);
$already_voted = $vote_check->fetch();
$vote_check->close();

// Hardcode the position name (e.g., Senator)
$position_name = 'Senator';

// Fetch all candidates with that position
$escaped_position = $RMAQconn->real_escape_string($position_name);
$sql_candidates = "SELECT * FROM candidate_table WHERE election_position = '$escaped_position'";
$res_candidates = $RMAQconn->query($sql_candidates);

$candidates = [];
if ($res_candidates && $res_candidates->num_rows > 0) {
    while ($cand = $res_candidates->fetch_assoc()) {
        $candidates[] = $cand;
    }
} else {
    die("No candidates found for position: $position_name");
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Local Ballot - College of Information and Computing Sciences</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body {
      background: #f9f9f9;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .header-bar {
      background-color: #fdb913;
      color: #000;
      padding: 1rem 2rem;
      display: flex;
      align-items: center;
      gap: 1rem;
      font-weight: 600;
    }
    .header-bar img {
      height: 50px;
      width: auto;
    }
    .header-text {
      font-size: 1.1rem;
      line-height: 1.2;
    }
    .ballot-container {
      max-width: 720px;
      margin: 2rem auto 4rem auto;
      background: white;
      border-radius: 8px;
      box-shadow: 0 6px 12px rgb(0 0 0 / 0.1);
      padding: 1rem 2rem 2rem 2rem;
    }
    .ballot-header {
      background-color: #fdb913;
      padding: 0.7rem 1rem;
      border-radius: 6px 6px 0 0;
      font-weight: 700;
      font-size: 1.25rem;
      text-align: center;
      user-select: none;
    }
    .ballot-subtitle {
      text-align: center;
      font-weight: 500;
      margin-top: 0.1rem;
      margin-bottom: 1.5rem;
      font-size: 1rem;
      color: #333;
    }
    .position-title {
      font-weight: 600;
      margin-bottom: 0.6rem;
      font-size: 1rem;
    }
    hr.divider {
      margin-top: 0;
      margin-bottom: 1rem;
      border: 0;
      border-top: 1px solid #ddd;
    }
    .candidate-option {
      display: flex;
      align-items: center;
      gap: 0.7rem;
      margin-bottom: 0.6rem;
    }
    .candidate-label {
      flex: 1;
      font-size: 0.95rem;
      font-weight: 500;
      color: #222;
      user-select: none;
    }
    .form-check-input {
      flex-shrink: 0;
      margin-top: 0.3rem;
      margin-right: 0.5rem;
    }
    .btn-container {
      display: flex;
      justify-content: flex-end;
      gap: 1rem;
      margin-top: 1.8rem;
    }
    .btn-clear {
      background-color: #6c757d;
      border: none;
      padding: 0.5rem 1.2rem;
      color: white;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    .btn-clear:hover {
      background-color: #5a6268;
    }
    .btn-submit {
      background-color: #198754;
      border: none;
      padding: 0.5rem 1.5rem;
      color: white;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    .btn-submit:hover {
      background-color: #146c43;
    }
  </style>

  <script>
  // Limit voter to max 12 selections
  document.addEventListener('DOMContentLoaded', () => {
    const maxSelections = 12;
    const checkboxes = document.querySelectorAll('input[type="checkbox"].candidate-checkbox');

    checkboxes.forEach(cb => {
      cb.addEventListener('change', () => {
        const checkedCount = Array.from(checkboxes).filter(c => c.checked).length;
        if (checkedCount > maxSelections) {
          alert(`You can only select up to ${maxSelections} candidates.`);
          cb.checked = false;
        }
      });
    });
  });
  </script>
</head>
<body>

<header class="header-bar">
  <img src="images/ust-commission-logo.png" alt="UST Commission on Elections Logo" />
  <div class="header-text">
    <div>University of Santo Tomas</div>
    <div style="font-weight: 600;">Commission on Elections</div>
  </div>
  <div style="margin-left:auto; font-size:1rem; font-weight:500; display: flex; align-items: center; gap: 1.2rem;">
    <?php
      // Always fetch the latest student number from the database
      if (isset($_SESSION['RMAQuser_id'])) {
          $uid = intval($_SESSION['RMAQuser_id']);
          $res = $RMAQconn->query("SELECT username FROM pma_register WHERE id = $uid LIMIT 1");
          if ($res && $row = $res->fetch_assoc()) {
              $student_number = $row['username'];
              echo "Student Number: <span style='color:#146c43'>" . htmlspecialchars($student_number) . "</span>";
          } else {
              echo "Student Number: <span style='color:#dc3545'>Unknown</span>";
          }
      }
    ?>
    <!-- Replace this logout form in your navigation -->
    <!--
    <form action="logout.php" method="post" style="display:inline;">
      <button type="submit" class="btn btn-danger btn-sm" style="margin-left: 10px;">Logout</button>
    </form>
    -->

    <!-- With this button -->
    <button type="button" class="btn btn-danger btn-sm" style="margin-left: 10px;" data-bs-toggle="modal" data-bs-target="#logoutModal">Logout</button>
  </div>
</header>

<div class="ballot-container">
  <div class="ballot-header">COLLEGE OF INFORMATION AND COMPUTING SCIENCES</div>
  <div class="ballot-subtitle">Local Ballot</div>

  
  <?php if ($already_voted): ?>
    <div class="alert alert-success text-center mt-5">
        <h3 class="fw-bold">You have already voted.</h3>
        <p>Your <strong>Voting Reference Code</strong> is:</p>
        <h4 class="text-primary fw-bold" style="letter-spacing: 2px;"><?= htmlspecialchars($reference_code) ?></h4>
        <p class="mt-4 text-muted">Thank you for participating!</p>
    </div>
  <?php else: ?>
    <form id="voteForm">
      <div class="position-block">
        <p class="position-title"><?php echo htmlspecialchars($position_name); ?></p>
        <hr class="divider" />
        <?php foreach ($candidates as $candidate): ?>
          <div class="form-check candidate-option">
            <input
              type="checkbox"
              class="candidate-checkbox"
              name="candidate_ids[]"
              value="<?= $candidate['candidate_id'] ?>"
              id="candidate<?= intval($candidate['candidate_id']) ?>"
            />
            <label
              class="candidate-label form-check-label"
              for="candidate<?php echo intval($candidate['candidate_id']); ?>"
            >
              <?php echo htmlspecialchars($candidate['candidate_name']); ?>
              (<?php echo htmlspecialchars($candidate['party_affiliation']); ?>)
            </label>
          </div>
        <?php endforeach; ?>
      </div>

      <div class="btn-container">
        <button type="reset" class="btn-clear">CLEAR</button>
        <button type="submit" class="btn-submit">SUBMIT</button>
      </div>
    </form>
  <?php endif; ?>
</div>

<!-- Confirmation Modal -->
<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form id="finalSubmitForm" method="POST" action="submit_vote.php">
        <div class="modal-header">
          <h5 class="modal-title" id="confirmModalLabel">Confirm Your Vote</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>You have selected the following candidates:</p>
          <ul id="selectedCandidatesList"></ul>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-success">Confirm & Submit</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Warning Modal -->
<div class="modal fade" id="warningModal" tabindex="-1" aria-labelledby="warningModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-danger text-white">
        <h5 class="modal-title" id="warningModalLabel">Warning</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="warningModalBody">
        <!-- Warning message will be inserted here -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>

<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form action="logout.php" method="post">
        <div class="modal-header bg-warning">
          <h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Are you sure you want to logout?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-danger">Confirm</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
  const maxSelections = 12;
  const voteForm = document.getElementById('voteForm');
  const finalSubmitForm = document.getElementById('finalSubmitForm');
  const selectedCandidatesList = document.getElementById('selectedCandidatesList');
  const confirmModal = new bootstrap.Modal(document.getElementById('confirmModal'));
  const warningModal = new bootstrap.Modal(document.getElementById('warningModal'));
  const warningModalBody = document.getElementById('warningModalBody');
  const checkboxes = voteForm.querySelectorAll('input[type="checkbox"].candidate-checkbox');

  function showWarning(message) {
    warningModalBody.textContent = message;
    warningModal.show();
  }

  // Limit checkbox selection to maxSelections
  checkboxes.forEach(cb => {
    cb.addEventListener('change', function() {
      const checkedCount = Array.from(checkboxes).filter(c => c.checked).length;
      if (checkedCount > maxSelections) {
        showWarning(`You can only select up to ${maxSelections} candidates.`);
        cb.checked = false;
      }
    });
  });

  voteForm.addEventListener('submit', function(e) {
    e.preventDefault();

    // Get all checked checkboxes
    const checked = voteForm.querySelectorAll('.candidate-checkbox:checked');
    // Remove any old hidden inputs not in the current selection
    Array.from(finalSubmitForm.querySelectorAll('input[type="hidden"]')).forEach(input => input.remove());
    selectedCandidatesList.innerHTML = '';

    if (checked.length === 0) {
      showWarning('Please select at least one candidate.');
      return;
    }
    if (checked.length > maxSelections) {
      showWarning(`You can only select up to ${maxSelections} candidates.`);
      return;
    }

    // For each checked, get the label text and add hidden input
    checked.forEach(cb => {
      const label = voteForm.querySelector('label[for="' + cb.id + '"]');
      const li = document.createElement('li');
      li.textContent = label ? label.textContent : cb.value;
      selectedCandidatesList.appendChild(li);

      // Add hidden input to modal form for submission
      const hidden = document.createElement('input');
      hidden.type = 'hidden';
      hidden.name = cb.name;
      hidden.value = cb.value;
      finalSubmitForm.appendChild(hidden);
    });

    // Show the modal only if there are checked candidates
    if (checked.length > 0) {
      confirmModal.show();
    }
  });

  // When the modal is hidden, clear hidden inputs
  document.getElementById('confirmModal').addEventListener('hidden.bs.modal', function () {
    Array.from(finalSubmitForm.querySelectorAll('input[type="hidden"]')).forEach(input => input.remove());
  });
});
</script>

</body>
</html>
<?php 
require_once('../class/Transaction.php');
$transactions = $transaction->getAllTransaction();

// echo '<pre>';
// 	print_r($transactions);
// echo '</pre>';
?>


<table id="myTable-trans" class="table table-bordered table-hover" cellspacing="0" width="100%">
	<thead>
	    <tr>
	        <th>Name</th>
	        <th><center>Age</center></th>
	        <th><center>Gender</center></th>
	        <th><center>Accomodation</center></th>
	        <th><center>Paid</center></th>
	        <th><center>Action</center></th>
	    </tr>
	</thead>
    <tbody>
    	<?php foreach($transactions as $t): ?>
    		<tr>
    			<td><?= ucwords($t['trans_passenger']); ?></td>
    			<td align="center"><?= $t['trans_age']; ?></td>
    			<td align="center"><?= $t['trans_gender']; ?></td>
    			<td align="center"><?= $t['acc_type']; ?></td>
    			<td align="center"><?= $t['trans_payment']; ?></td>
    			<td align="center">
    				<button type="button" onclick="tenPercent(<?= $t['trans_id']; ?>, .90);" class="btn btn-success btn-xs">10 %
    				</button>

    				<button type="button" onclick="tenPercent(<?= $t['trans_id']; ?>, .80);" class="btn btn-info btn-xs">20 %
    				</button>
    			</td>
    		</tr>
    	<?php endforeach; ?>
    </tbody>
</table>

<?php 
$transaction->Disconnect();
 ?>
<!-- for the datatable of employee -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#myTable-trans').DataTable();
	});
</script>

{% docs order_status_definitions %}

The lifecycle stage of the order. Possible values include:

* **placed** | The initial state. The customer has submitted the order, but payment or warehouse processing may still be pending.
* **shipped** | The order has been packed and handed over to the carrier. A tracking number is usually available at this stage.
* **completed** | The final successful state. The order has been delivered to the customer, and the return window is typically active.
* **return_pending** | The customer has initiated a return request, but the items have not yet been received or processed by the warehouse.
* **returned** | The return process is finished. Items have been received, and a refund has likely been issued.

{% enddocs %}
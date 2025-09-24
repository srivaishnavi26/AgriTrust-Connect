import { LightningElement, api, wire } from 'lwc';
import getProcurementStatus from '@salesforce/apex/ProcurementController.getProcurementStatus';

export default class ProcurementTracker extends LightningElement {
    @api recordId;
    status;
    error;

    @wire(getProcurementStatus, { procurementId: '$recordId' })
    wiredStatus({ error, data }) {
        if (data) {
            this.status = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.status = undefined;
            console.error('Error fetching status:', error);
        }
    }

    get currentStep() {
        return this.status;
    }
}
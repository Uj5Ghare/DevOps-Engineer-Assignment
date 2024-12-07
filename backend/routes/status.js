const express = require('express');
const router = express.Router();
const os = require('os');
const moment = require('moment');

// Calculate uptime in human-readable format
function getUptime() {
    const uptimeInSeconds = os.uptime();
    const uptime = moment.duration(uptimeInSeconds, 'seconds').humanize();
    return uptime;
}

// Define the /status endpoint
router.get('/', (req, res) => {
    const status = 'OK';
    const uptime = getUptime();

    res.json({
        status,
        uptime,
    });
});

module.exports = router;

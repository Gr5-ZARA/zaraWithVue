import express from 'express';
import { searchHelp, getHelpAnswer } from '../controller/help';

const router = express.Router();

router.get('/help', searchHelp);
router.get('/help/:id', getHelpAnswer);


export default router;

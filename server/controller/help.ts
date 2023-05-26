import { Request, Response } from 'express';
import { searchQuestions, getAnswer } from '../models/help';

export const searchHelp = (req: Request, res: Response) => {
  const searchTerm = req.query.searchTerm as string;

  searchQuestions(searchTerm)
    .then((questions) => {
      res.status(200).json(questions);
    })
    .catch((error) => {
      res.status(500).json({ error: 'An error occurred while searching for questions' });
    });
};

export const getHelpAnswer = (req: Request, res: Response) => {
  const questionId = req.params.id as string;

  if (!questionId) {
    res.status(400).json({ error: 'Question ID is required' });
    return;
  }

  getAnswer(questionId)
    .then((answer) => {
      res.status(200).json({ answer });
    })
    .catch((error) => {
      res.status(500).json({ error: 'An error occurred while retrieving the answer' });
    });
};

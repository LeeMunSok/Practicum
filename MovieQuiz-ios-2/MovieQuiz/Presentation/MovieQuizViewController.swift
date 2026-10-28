import UIKit

final class MovieQuizViewController: UIViewController {
    
    private var presenter: MovieQuizPresenter!
    private var currentQuestion: QuizQuestion?
    private var alertPresenter = AlertPresenter()
    private var statisticService: StatisticServiceProtocol = StatisticService()
    
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private  var counterLabel: UILabel!
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
                presenter.yesButtonClicked()
            }
    @IBAction private func noButtonClicked(_ sender: UIButton) {
               presenter.noButtonClicked()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                presenter = MovieQuizPresenter(viewController: self)
                imageView.layer.cornerRadius = 20

    }
    
    // MARK: - QuestionFactoryDelegate
    func showLoadingIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    func showNetworkError(message: String) {
        activityIndicator.isHidden = true
        
        let errorAlert = AlertModel(title: "Ошибка",message: message, buttonText: "Попробуйте еще раз") { [weak self] in
            guard let self = self else { return }
            self.presenter.resetQuestionIndex()
            self.presenter.restartGame()
            self.presenter.restartGame()
        }
        self.alertPresenter.show(in: self, model: errorAlert)
    }
    
    
    func showAnswerResult(isCorrect: Bool) {
        presenter.didAnswer(isCorrectAnswer: isCorrect)
        
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreenIOS.cgColor : UIColor.ypRedIOS.cgColor
        imageView.layer.cornerRadius = 20
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){ [weak self ] in
            guard let self = self else { return }
                        self.presenter.showNextQuestionOrResults()
        }
    }
    func show(quiz step: QuizStepViewModel) {
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.image = UIImage(data: step.image) ?? UIImage()
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    func show(quiz result: QuizResultsViewModel) {
        let model = AlertModel(
                    title: result.title,
                    message: result.text,
                    buttonText: result.buttonText
                ) { [weak self] in
                    guard let self = self else { return }
                    self.presenter.resetQuestionIndex()
                    self.presenter.correctAnswers = 0
                    self.presenter.restartGame()
                }
        alertPresenter.show(in: self, model: model)
    }
    func hideLoadingIndicator() {
            activityIndicator.isHidden = true
        }
}


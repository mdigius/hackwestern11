//
//  LearningView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI



struct LearningView: View {
    @Environment(\.modelContext) private var modelContext
    let learningItems: [LearningItem] = [
        LearningItem(title: "How to Master Budgeting", itemDescription: "Learn how to manage your budget effectively.", imageName: "dollarsign.circle", learningText: "Budgeting is the cornerstone of financial health. Learn how to allocate your income effectively by distinguishing between needs, wants, and savings goals. Understand the 50/30/20 rule, which suggests spending 50% of your income on necessities, 30% on discretionary items, and saving the remaining 20%. Discover tools like budgeting apps, spreadsheets, or simple notebooks to track expenses, identify unnecessary spending, and stay on top of bills. Mastering budgeting empowers you to live within your means while building financial security for the future."),
        LearningItem(title: "Understanding Taxes", itemDescription: "Key insights into tax filing and returns.", imageName: "doc.text", learningText: "Taxes might seem complex, but understanding the basics can save you money. Learn about income taxes, tax brackets, and deductions that reduce your taxable income. Understand the difference between tax credits and deductions, and how they impact your final bill. Explore how filing status, dependents, and common deductions like student loan interest or education credits apply to you. With this knowledge, you can approach tax season confidently, whether you’re filing yourself or working with a professional."),
        LearningItem(title: "Investments 101", itemDescription: "Start your journey into investing.", imageName: "chart.bar", learningText: "Investing is a powerful tool for building wealth. Learn the fundamentals of stocks, bonds, and mutual funds, and how they fit into a diversified portfolio. Understand the importance of starting early to take advantage of compound interest. Explore risk vs. reward and why long-term investment strategies outperform short-term speculation. With this knowledge, you can begin making informed decisions to grow your financial future."),
        LearningItem(title: "Loans & Borrowing", itemDescription: "Tips for handling loans and credit responsibly.", imageName: "creditcard", learningText: "Borrowing can be a useful tool when managed wisely. Learn about interest rates, repayment terms, and the difference between good debt (like student loans) and bad debt (like high-interest credit cards). Discover strategies to pay down debt faster and improve your credit score, a crucial factor in securing future loans. With the right approach, loans can support your goals without becoming a financial burden."),
        LearningItem(title: "Paycheck Breakdown", itemDescription: "Understand the components of your paycheck.", imageName: "calendar", learningText: "Your paycheck holds vital information about your financial health. Learn how to read it, from gross income to net pay. Understand deductions, including taxes, Social Security, and benefits like health insurance or retirement contributions. Discover how pre-tax benefits can save you money and why it’s important to regularly review your pay stub for accuracy. A clear understanding of your paycheck ensures you’re maximizing your earnings and managing your finances effectively."),
        LearningItem(title: "Emergency Funds", itemDescription: "Build a safety net for unexpected expenses.", imageName: "checkmark.shield", learningText: "An emergency fund is your financial safety net for life's unexpected events. Learn how to calculate the ideal amount to save—usually three to six months of living expenses. Discover strategies to build your fund gradually, even on a tight budget, by setting small, achievable goals. Understand where to keep your emergency savings, such as in a high-yield savings account, for easy access when needed. Having an emergency fund reduces financial stress and protects you from debt during challenging times."),
        LearningItem(title: "Retirement Planning", itemDescription: "Start planning your financial future today.", imageName: "clock", learningText: "Retirement may seem far away, but starting early is key to building a comfortable future. Learn about employer-sponsored plans like 401(k)s or individual retirement accounts (IRAs), and how contributions grow over time with compound interest. Understand the benefits of matching contributions and tax advantages these accounts offer. Explore strategies for setting realistic savings goals and increasing contributions as your income grows. Planning for retirement now ensures you have the financial freedom to enjoy life later.")

    ]

    var body: some View {
        NavigationView { // Wrap in NavigationView
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Large, featured item
                    LearningItemView(item: learningItems[0], isLarge: true)

                    // Horizontal scroll view
                    Text("Explore Topics")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(learningItems.dropFirst()) { item in
                                LearningItemView(item: item, isLarge: false)
                                    
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Learning Hub") // Set navigation title
        }
    }
}

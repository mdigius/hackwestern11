//
//  LearningView.swift
//  hackwestern11
//
//  Created by Michael Di Giuseppe on 2024-11-30.
//

import SwiftUI
import SwiftData


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
    
    let guides: [Guide] = [
        Guide(icon: "chart.pie.fill",
              title: "Saving for Big Goals",
              subtitle: "Tips to save effectively for major life milestones like buying a car or home.",
              guideDescription: "Saving for big goals, such as purchasing a car, buying a home, or planning a dream vacation, requires careful planning and discipline. Start by setting clear, measurable goals and calculating how much money you’ll need to save. Create a dedicated savings account for each goal to avoid mixing funds. Automate your savings by setting up regular transfers into these accounts. Reduce unnecessary expenses and direct those funds toward your goals. Take advantage of budgeting tools to track progress and stay motivated. With consistency and focus, you’ll be able to achieve your financial milestones while maintaining your financial stability."),
        Guide(icon: "lock.fill",
              title: "Protecting Your Finances",
              subtitle: "Discover best practices to safeguard your finances and avoid scams.",
              guideDescription: "In today’s digital world, protecting your finances is more important than ever. Start by securing your online accounts with strong, unique passwords and enabling two-factor authentication whenever possible. Monitor your bank and credit card statements regularly for unauthorized transactions, and promptly report any discrepancies. Be cautious of phishing scams, especially through emails or text messages that ask for personal information. Use secure Wi-Fi connections and avoid accessing financial accounts on public networks. Safeguard sensitive documents by storing them in a safe place or shredding them if no longer needed. Taking these proactive steps will help you secure your financial future."),
        Guide(icon: "gauge.open.with.lines.needle.67percent.and.arrowtriangle",
              title: "Understanding Credit Scores",
              subtitle: "Learn how credit scores work and strategies to improve yours.",
              guideDescription: "Your credit score plays a crucial role in determining your financial credibility and opportunities. It is calculated based on factors like payment history, credit utilization, length of credit history, types of credit used, and recent credit inquiries. A high credit score can qualify you for lower interest rates on loans and credit cards. To improve your score, always pay bills on time, keep credit card balances below 30% of their limits, and avoid applying for unnecessary credit. Regularly review your credit report for errors and dispute inaccuracies promptly. Understanding and managing your credit score empowers you to make better financial decisions."),
        Guide(icon: "briefcase",
              title: "Navigating Job Benefits",
              subtitle: "Understand health insurance, 401(k)s, and other workplace perks.",
              guideDescription: "Job benefits are an essential part of your overall compensation package, providing financial security and added value. Start by understanding your health insurance options, including deductibles, premiums, and coverage networks. If your employer offers a 401(k) or similar retirement plan, contribute enough to take full advantage of any matching contributions—it’s essentially free money. Explore other perks like paid time off, stock options, employee discounts, or wellness programs. Ask your HR department if you’re unsure about specific benefits. By fully understanding and utilizing your job benefits, you can maximize your compensation while planning for both short-term needs and long-term financial goals.")
        
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Featured Learning Item
                    LearningItemView(item: learningItems[0], isLarge: true)
                    
                    // Explore Topics Section
                    Text("Explore Topics")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(learningItems.dropFirst()) { item in
                                LearningItemView(item: item, isLarge: false)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Guides Section
                    Text("Recent Guides")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    ForEach(guides, id: \.title) { guide in
                        NavigationLink(destination: GuideInfoView(guide: guide)) {
                            GuideView(guide: guide)
                        }
                        .buttonStyle(PlainButtonStyle()) // Ensure no unwanted button style effects
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Learning Hub")
        }
    }
}
